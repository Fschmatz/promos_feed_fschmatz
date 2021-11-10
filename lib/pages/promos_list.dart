import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:promos_feed_fschmatz/widgets/promo_tile.dart';
import 'package:webfeed/webfeed.dart';

class PromosList extends StatefulWidget {

  String urlFeed;
  PromosList({Key? key,required this.urlFeed}) : super(key: key);

  @override
  _PromosListState createState() => _PromosListState();
}

class _PromosListState extends State<PromosList> {

  static String feedUrl = '';
  List<RssItem> _articlesList = [];
  bool _loading = true;

  @override
  void initState() {
    feedUrl = widget.urlFeed;
    getRssData();
    super.initState();
  }

  Future<void> getRssData() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(feedUrl)).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: const Text('Loading Error'),
          duration: const Duration(seconds: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: getRssData,
          ),
        ));
      },
    );;
    var channel = RssFeed.parse(response.body);
    setState(() {
      _articlesList = channel.items!.toList();
      _loading = false;
    });
    client.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                ),
              )
            : RefreshIndicator(
                onRefresh: getRssData,
                color: Theme.of(context).accentColor,
                child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16,),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _articlesList.length,
                        itemBuilder: (context, index) {
                          return PromoTile(
                            feed: Feed(
                                data: _articlesList[index].pubDate.toString(),
                                title: _articlesList[index].title!,
                                link: _articlesList[index].link!),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ),
      ),
    );
  }
}

//_articlesList[index].pubDate!.day.toString()
