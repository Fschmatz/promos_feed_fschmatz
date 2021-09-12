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

  /*https://forum.adrenaline.com.br/forums/produtos-importados.245/index.rss
  https://forum.adrenaline.com.br/forums/for-sale.221/index.rss
  https://nitter.net/hardmob_promo/rss*/

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
    var response = await client.get(Uri.parse(feedUrl));
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
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
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
