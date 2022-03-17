import 'dart:async';
import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/widgets/promo_tile_hm.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:promos_feed_fschmatz/configs/settings_page.dart';
import 'package:promos_feed_fschmatz/widgets/promo_tile.dart';

class HardmobScraper extends StatefulWidget {
  const HardmobScraper({Key? key}) : super(key: key);

  @override
  _HardmobScraperState createState() => _HardmobScraperState();
}

class _HardmobScraperState extends State<HardmobScraper> {
  String mainUrl = 'https://www.hardmob.com.br';
  String sectionUrl = '/forums/407-Promocoes';
  bool _loading = true;
  String linkUrl = 'https://www.hardmob.com.br/threads/';
  List<Map<String, dynamic>> _titleList = [];
  List<Map<String, dynamic>> _commentsCount = [];

  @override
  void initState() {
    parseData();
    super.initState();
  }

  Future<void> parseData() async {
    final webScraper = WebScraper(mainUrl);
    if (await webScraper.loadWebPage(sectionUrl)) {
      _titleList = webScraper.getElement(
          'li.threadbit > div > div > div.inner > h3 > a.title', ['href']);

      _commentsCount =
          webScraper.getElement('li.threadbit > div > ul > li > a', []);

      //REMOVE FIXED POSTS
      _titleList.removeRange(0, 2);
      _commentsCount.removeRange(0, 2);

      setState(() {
        _titleList;
        _commentsCount;
        _loading = false;
      });
    } else {
      throw ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: const Text('Error'),
        duration: const Duration(seconds: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        action: SnackBarAction(
          label: 'RETRY',
          onPressed: parseData,
        ),
      ));
    }
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
                  onRefresh: parseData,
                  color: Theme.of(context).colorScheme.primary,
                  child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 16,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _titleList.length,
                          itemBuilder: (context, index) {
                            return PromoTileHm(
                              feed: Feed(
                                  data: ' ',
                                  title: _titleList[index]['title'],
                                  link: linkUrl +
                                      _titleList[index]['attributes']['href']),
                              commentsCount: _commentsCount[index]['title'],
                            );
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
