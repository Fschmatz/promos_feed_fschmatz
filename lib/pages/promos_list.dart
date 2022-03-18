import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:promos_feed_fschmatz/configs/settings_page.dart';
import 'package:promos_feed_fschmatz/widgets/promo_tile.dart';
import 'package:webfeed/webfeed.dart';
import 'package:jiffy/jiffy.dart';

class PromosList extends StatefulWidget {
  String urlFeed;

  PromosList({Key? key, required this.urlFeed}) : super(key: key);

  @override
  _PromosListState createState() => _PromosListState();
}

class _PromosListState extends State<PromosList> {
  static String feedUrl = '';
  List<RssItem>? _feedList = [];
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
    );

    var channel = RssFeed.parse(response.body);
    setState(() {
      _feedList = channel.items!.toList();
      _loading = false;
    });
    client.close();
  }

  bool dataDiferente(int index) {
    return Jiffy(_feedList![index == 0 ? index : index - 1].pubDate!)
            .format("dd/MM/yyyy") !=
        Jiffy(_feedList![index].pubDate!).format("dd/MM/yyyy");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Promos Feed'),
              pinned: false,
              floating: true,
              snap: true,
              actions: [
                IconButton(
                    icon: const Icon(
                      Icons.settings_outlined,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SettingsPage(),
                            fullscreenDialog: true,
                          ));
                    }),
              ],
            ),
          ];
        },
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              : RefreshIndicator(
                  onRefresh: getRssData,
                  color: Theme.of(context).colorScheme.primary,
                  child: _feedList!.length == 1
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.error_outline,
                                size: 28,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Feed Offline",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        )
                      : ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _feedList!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                    Visibility(
                                        visible: index == 0,
                                        child: dataTile(
                                            _feedList![index].pubDate!,
                                            context,
                                            index)),
                                    Visibility(
                                        visible: dataDiferente(index),
                                        child: dataTile(
                                            _feedList![index].pubDate!,
                                            context,
                                            index)),
                                    PromoTile(
                                      key: UniqueKey(),
                                      feed: Feed(
                                          data: _feedList![index]
                                              .pubDate!
                                              .toString(),
                                          title: _feedList![index].title!,
                                          link: _feedList![index].link),
                                    ),
                                  ]);
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ]),
                ),
        ),
      ),
    );
  }
}

Widget dataTile(DateTime data, BuildContext context, int index) {
  Color corDataTile = Theme.of(context).colorScheme.primary.withOpacity(0.9);

  return ListTile(
    leading: Icon(
      Icons.calendar_today_outlined,
      color: corDataTile,
    ),
    title: Text(
      Jiffy(data).format("dd/MM/yyyy"),
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: corDataTile),
    ),
  );
}
