import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoTileHm extends StatefulWidget {
  @override
  _PromoTileHmState createState() => _PromoTileHmState();

  Feed? feed;
  String commentsCount;

  PromoTileHm({Key? key, required this.feed, required this.commentsCount})
      : super(key: key);
}

class _PromoTileHmState extends State<PromoTileHm> {
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

    Color accent = Theme.of(context).colorScheme.primary.withOpacity(0.9);
    TextStyle detailsStyle =
     TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: accent);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      onLongPress: () {
        Share.share(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
      ),
      trailing : SizedBox(
        width: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.mode_comment_outlined,
              size: 18,
              color: accent,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.commentsCount, style: detailsStyle),
          ],
        ),
      ),
    );
  }
}
