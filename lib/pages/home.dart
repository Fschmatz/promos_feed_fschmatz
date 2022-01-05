import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/pages/promos_list.dart';

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
      //urlFeed: 'https://nitter.net/hardmob_promo/rss', ANTIGO
      urlFeed:
          'https://bridge.noisebridge.info/?action=display&bridge=Twitter&context=By+username&u=hardmob_promo&norep=on&noretweet=on&nopinned=on&nopic=on&noimg=on&noimgscaling=on&format=Mrss',
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

  TextStyle returnColor(int index) {
    if (_currentIndex != index) {
      return TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w600,
          color:
              Theme.of(context).textTheme.headline6!.color!.withOpacity(0.8));
    } else {
      return TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).accentColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _feedList[_currentIndex],
      bottomNavigationBar: NavigationBar(
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
              color: Colors.black87,
            ),
            label: 'HardMob',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_offer_outlined),
            selectedIcon: Icon(
              Icons.local_offer,
              color: Colors.black87,
            ),
            label: 'For Sale',
          ),
          NavigationDestination(
            icon: Icon(Icons.public_outlined),
            selectedIcon: Icon(
              Icons.public,
              color: Colors.black87,
            ),
            label: 'Importados',
          ),
        ],
      ),

    );
  }
}