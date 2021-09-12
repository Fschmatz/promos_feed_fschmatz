import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/configs/settings_page.dart';
import 'package:promos_feed_fschmatz/pages/promos_list.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _feedList = [
    PromosList(
      key: UniqueKey(),
      urlFeed: 'https://nitter.net/hardmob_promo/rss',
    ),
    PromosList(
      key: UniqueKey(),
      urlFeed: 'https://forum.adrenaline.com.br/forums/for-sale.221/index.rss',
    ),
    PromosList(
      key: UniqueKey(),
      urlFeed:
          'https://forum.adrenaline.com.br/forums/produtos-importados.245/index.rss',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle styleFontNavBar = TextStyle(
        fontSize: 14.5,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).accentColor);

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
      body: SafeArea(child: _feedList[_currentIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: GNav(
              rippleColor: Theme.of(context).accentColor.withOpacity(0.5),
              hoverColor: Theme.of(context).accentColor.withOpacity(0.5),
              gap: 2,
              activeColor: Theme.of(context).accentColor,
              tabBorderRadius: 10,
              iconSize: 0,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: const Duration(milliseconds: 500),
              tabBackgroundColor:
              Theme.of(context).accentColor.withOpacity(0.3),
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
              tabs: [
                GButton(
                  icon: Icons.circle,
                  leading: Text('   HardMob', style: styleFontNavBar),
                  textStyle: styleFontNavBar,
                ),
                GButton(
                  icon: Icons.circle,
                  leading: Text('   For Sale', style: styleFontNavBar),
                  textStyle: styleFontNavBar,
                ),
                GButton(
                  icon: Icons.circle,
                  leading: Text('   Importados', style: styleFontNavBar),
                  textStyle: styleFontNavBar,
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

//_articlesList[index].pubDate!.day.toString()
