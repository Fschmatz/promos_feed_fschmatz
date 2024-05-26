import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/util/app_details.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import '../util/dialog_select_theme.dart';
import '../util/utils.dart';
import 'app_info.dart';
import 'changelog.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();

  const SettingsPage({Key? key}) : super(key: key);
}

class _SettingsPageState extends State<SettingsPage> {

  String getThemeStringFormatted() {
    String theme = EasyDynamicTheme.of(context)
        .themeMode
        .toString()
        .replaceAll('ThemeMode.', '');
    if (theme == 'system') {
      theme = 'system default';
    }
    return Utils().capitalizeFirstLetterString(theme);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color primaryColor = theme.colorScheme.primary;
    Color onPrimaryColor = theme.colorScheme.onPrimary;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              margin: const EdgeInsets.fromLTRB(16, 20, 16, 25),
              color: primaryColor,
              child: ListTile(
                title: Text(
                  AppDetails.appName + " " + AppDetails.appVersion,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.5, color: onPrimaryColor),
                ),
              ),
            ),
            ListTile(
              title: Text("General",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primaryColor)),
            ),
            ListTile(
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DialogSelectTheme();
                  }),
              leading: const Icon(Icons.brightness_6_outlined),
              title: const Text(
                "App theme",
              ),
              subtitle: Text(
                getThemeStringFormatted(),
              ),
            ),
            ListTile(
              title: Text("About",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primaryColor)),
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
              ),
              title: const Text(
                "App info",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const AppInfoPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.article_outlined,
              ),
              title: const Text(
                "Changelog",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const ChangelogPage(),
                    ));
              },
            ),
          ],
        ));
  }
}
