import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:promos_feed_fschmatz/configs/settings_page.dart';
import 'package:promos_feed_fschmatz/widgets/news_tile.dart';
import 'package:webfeed/webfeed.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*https://forum.adrenaline.com.br/forums/produtos-importados.245/index.rss
  https://forum.adrenaline.com.br/forums/for-sale.221/index.rss
  https://nitter.net/hardmob_promo/rss*/

  static const String feedUrl = 'https://forum.adrenaline.com.br/forums/for-sale.221/index.rss';
  List<RssItem> _articlesList = [];
  bool _loading = true;

  @override
  void initState() {
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
      appBar: AppBar(
        elevation: 0,
        title: const Text('Promos Feed'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings_outlined,
                color: Theme.of(context)
                    .textTheme
                    .headline6!
                    .color!
                    .withOpacity(0.7),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SettingsPage(),
                      fullscreenDialog: true,
                    ));
              }),
        ],
      ),
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
                          return NewsTile(
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
