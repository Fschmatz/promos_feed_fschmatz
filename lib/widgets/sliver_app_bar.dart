import 'package:flutter/material.dart';
import '../configs/settings_page.dart';

class AppBarSliver extends StatelessWidget {
  const AppBarSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
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
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                    const SettingsPage(),
                  ));
            }),
      ],
    );
  }
}
