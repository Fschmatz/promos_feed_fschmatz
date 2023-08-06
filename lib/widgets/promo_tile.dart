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
   launchUrl(
     Uri.parse(url),
     mode: LaunchMode.externalApplication,
   );
 }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:   const EdgeInsets.fromLTRB(16, 5, 16, 5),
      child: ListTile(
        onTap: () {
          _launchBrowser(widget.feed!.link!);
        },
        title: Text(
          promoTitle,
        ),
        onLongPress:  () {
          Share.share(widget.feed!.link!);
        },
      ),
    );
  }
}
