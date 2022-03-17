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
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
        style: const TextStyle(fontSize: 16),
      ),
      onLongPress:  () {
        Share.share(widget.feed!.link!);
      },
    );
  }
}
