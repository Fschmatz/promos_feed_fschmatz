import 'dart:async';
import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/widgets/promo_tile_hm.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:promos_feed_fschmatz/configs/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HardmobScraper extends StatefulWidget {
  const HardmobScraper({super.key});

  @override
  State<HardmobScraper> createState() => _HardmobScraperState();
}

class _HardmobScraperState extends State<HardmobScraper> {
  String link = 'https://www.hardmob.com.br/forums/407-Promocoes';
  bool _loading = true;
  String linkUrl = 'https://www.hardmob.com.br/threads/';
  List<Map<String, dynamic>> _titleList = [];
  List<Map<String, dynamic>> _commentsCount = [];

  //List<Map<String, dynamic>> _lastCommentLink = [];
  List<Map<String, dynamic>> _lastCommentTime = [];
  bool showReloadButton = false;

  @override
  void initState() {
    super.initState();

    parseData();
  }

  Future<void> parseData() async {
    final webScraper = WebScraper();

    try {
      if (await webScraper.loadFullURL(link).timeout(const Duration(seconds: 10))) {
        _titleList = webScraper.getElement('li.threadbit > div > div > div.inner > h3 > a.title', ['href']);
        _commentsCount = webScraper.getElement('li.threadbit > div > ul > li > a', []);
        _lastCommentTime = webScraper.getElement('li.threadbit > div > dl > dd:nth-child(7)', []);

        //_lastCommentLink = webScraper.getElement('li.threadbit > div > dl > dd > a', ['href']);
        //_lastCommentLink.isNotEmpty &&

        if (_titleList.isNotEmpty && _commentsCount.isNotEmpty && _lastCommentTime.isNotEmpty) {
          try {
            //REMOVE FIXED POSTS
            _titleList.removeRange(0, 3);
            _commentsCount.removeRange(0, 3);
            // _lastCommentLink.removeRange(0, 3);
            _lastCommentTime.removeRange(0, 3);
          } on Exception catch (e) {
            _showErrorToast();
          }
          setState(() {
            _loading = false;
          });
        } else {
          _showReloadButton();
        }
      } else {
        _showErrorToast();
      }
    } on TimeoutException {
      _showReloadButton();
    }
  }

  void _showReloadButton() {
    setState(() {
      showReloadButton = true;
    });
  }

  Future<void> reloadData() async {
    setState(() {
      _loading = true;
      showReloadButton = false;
    });

    parseData();
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
        title: const Text('Promos Feed - hardMOB'),
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
        duration: const Duration(milliseconds: 450),
        child: (_loading)
            ? showReloadButton
                ? Center(
                    child: OutlinedButton.icon(
                      icon: const Icon(
                        Icons.refresh_outlined,
                      ),
                      onPressed: reloadData,
                      label: const Text("Reload"),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
            : RefreshIndicator(
                onRefresh: reloadData,
                color: Theme.of(context).colorScheme.primary,
                child: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) => const Divider(
                      height: 0,
                    ),
                    shrinkWrap: true,
                    itemCount: _titleList.length,
                    itemBuilder: (context, index) {
                      return PromoTileHm(
                        key: UniqueKey(),
                        feed: Feed(data: ' ', title: _titleList[index]['title'], link: linkUrl + _titleList[index]['attributes']['href']),
                        commentsCount: _commentsCount[index]['title'],
                        lastCommentTime: _lastCommentTime[index]['title'],
                        lastCommentLink: "",
                        //lastCommentLink: linkUrl + _lastCommentLink[index]['attributes']['href'],
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
