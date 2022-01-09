import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoTile extends StatefulWidget {
  @override
  _PromoTileState createState() => _PromoTileState();

  Feed? feed;

  PromoTile({Key? key, required this.feed}) : super(key: key);
}

class _PromoTileState extends State<PromoTile> {

 String promoTitle = '';

  @override
  void initState() {
    promoTitle = widget.feed!.title!;
    if (promoTitle.contains('hardmob')){
      List formatString = promoTitle.split("https://");
      promoTitle = formatString[0];
    }
    super.initState();
  }

  //URL LAUNCHER
  _launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 7, 16, 7),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: SizedBox(
        width: 55,
        child: TextButton(
          onPressed: () {
            Share.share(widget.feed!.link!);
          },
          child: Icon(
            Icons.share_outlined,
            size: 19.0,
            color: Theme.of(context)
                .textTheme
                .headline6!
                .color!
                .withOpacity(0.7),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).cardTheme.color,
            onPrimary: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
