import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/pages/hm_scraper.dart';
import 'package:promos_feed_fschmatz/pages/promos_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*int _currentIndex = 0;
  final List<Widget> _feedList = [
    HardmobScraper(
      key: UniqueKey(),
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
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HardmobScraper(
          key: UniqueKey(),
        ),
      ),
/*      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(
              Icons.shopping_bag,
            ),
            label: 'HardMob',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_offer_outlined),
            selectedIcon: Icon(
              Icons.local_offer,
            ),
            label: 'For Sale',
          ),
          NavigationDestination(
            icon: Icon(Icons.public_outlined),
            selectedIcon: Icon(
              Icons.public,
            ),
            label: 'Importados',
          ),
        ],
      ),*/
    );
  }
}

/*
ANTIGO HARD MOB COM FEED VIA TWITTER

  PromosList(
      key: UniqueKey(),
      urlFeed: 'https://nitter.net/hardmob_promo/rss',
     //Retornando erro
     /* urlFeed:
          'https://bridge.noisebridge.info/?action=display&bridge=Twitter&context=By+username&u=hardmob_promo&norep=on&noretweet=on&nopinned=on&nopic=on&noimg=on&noimgscaling=on&format=Mrss',*/
    ),

*/
