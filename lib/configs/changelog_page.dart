import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/util/app_details.dart';


class ChangelogPage extends StatelessWidget {
  const ChangelogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color themeColorApp = Theme.of(context).colorScheme.primary;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Changelog"),
          elevation: 0,
        ),
        body: ListView(children: <Widget>[
          ListTile(
              leading: const SizedBox(
                height: 0.1,
              ),
              title: Text("Current Version".toUpperCase(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: themeColorApp))),
          ListTile(
            leading: const Icon(
              Icons.article_outlined,
            ),
            title: Text(
              AppDetails.changelogCurrent,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const SizedBox(
              height: 0.1,
            ),
            title: Text("Previous Versions".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: themeColorApp)),
          ),
          ListTile(
            leading: const Icon(
              Icons.article_outlined,
            ),
            title: Text(
              AppDetails.changelogsOld,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ]));
  }
}
