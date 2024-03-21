import 'dart:async';
import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/widgets/promo_tile_hm.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:promos_feed_fschmatz/configs/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    super.initState();

    parseData();
  }

  Future<void> parseData() async {
    final webScraper = WebScraper(mainUrl);
    if (await webScraper.loadWebPage(sectionUrl)) {
      _titleList = webScraper.getElement('li.threadbit > div > div > div.inner > h3 > a.title', ['href']);

      _commentsCount = webScraper.getElement('li.threadbit > div > ul > li > a', []);

      _lastCommentLink = webScraper.getElement('li.threadbit > div > dl > dd > a', ['href']);

      _lastCommentTime = webScraper.getElement('li.threadbit > div > dl > dd:nth-child(7)', []);

      //REMOVE FIXED POSTS
      try {
        _titleList.removeRange(0, 2);
        _commentsCount.removeRange(0, 2);
        _lastCommentLink.removeRange(0, 2);
        _lastCommentTime.removeRange(0, 2);
      } on Exception catch (e) {
        _showErrorToast();
      }
    } else {
      _showErrorToast();
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  void _showErrorToast() {
    Fluttertoast.showToast(
      msg: "No Results Found!",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promos Feed - Hardmob'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SettingsPage(),
                    ));
              }),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: (_loading)
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : RefreshIndicator(
                onRefresh: parseData,
                color: Theme.of(context).colorScheme.primary,
                child: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                    shrinkWrap: true,
                    itemCount: _titleList.length,
                    itemBuilder: (context, index) {
                      return PromoTileHm(
                        key: UniqueKey(),
                        feed: Feed(data: ' ', title: _titleList[index]['title'], link: linkUrl + _titleList[index]['attributes']['href']),
                        commentsCount: _commentsCount[index]['title'],
                        lastCommentTime: _lastCommentTime[index]['title'],
                        lastCommentLink: linkUrl + _lastCommentLink[index]['attributes']['href'],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ]),
              ),
      ),
    );
  }
}
