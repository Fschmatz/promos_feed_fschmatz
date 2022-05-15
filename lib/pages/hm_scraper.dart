import 'dart:async';
import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/widgets/promo_tile_hm.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:promos_feed_fschmatz/configs/settings_page.dart';

import '../widgets/sliver_app_bar.dart';

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
  List<Map<String, dynamic>> _lastCommentLink = [];
  List<Map<String, dynamic>> _lastCommentTime = [];

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

      _lastCommentLink =
          webScraper.getElement('li.threadbit > div > dl > dd > a', ['href']);

      _lastCommentTime =
          webScraper.getElement('li.threadbit > div > dl > dd:nth-child(7)', []) ;

      //REMOVE FIXED POSTS
      _titleList.removeRange(0, 2);
      _commentsCount.removeRange(0, 2);
      _lastCommentLink.removeRange(0, 2);
      _lastCommentTime.removeRange(0, 2);

      setState(() {
        _titleList;
        _commentsCount;
        _lastCommentLink;
        _lastCommentTime;
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
            const AppBarSliver()
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
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _titleList.length,
                          itemBuilder: (context, index) {
                            return PromoTileHm(
                              key: UniqueKey(),
                              feed: Feed(
                                  data: ' ',
                                  title: _titleList[index]['title'],
                                  link: linkUrl +
                                      _titleList[index]['attributes']['href']),
                              commentsCount: _commentsCount[index]['title'],
                              lastCommentTime: _lastCommentTime[index]['title'],
                              lastCommentLink: linkUrl +
                                  _lastCommentLink[index]['attributes']['href'],
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
