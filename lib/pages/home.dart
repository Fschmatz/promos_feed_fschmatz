import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/pages/hm_scraper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HardmobScraper(
          key: UniqueKey(),
        ),
      ),
    );
  }
}

