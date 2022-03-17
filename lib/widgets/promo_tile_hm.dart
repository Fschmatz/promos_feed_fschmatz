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
    Color appAccent = Theme.of(context).colorScheme.primary;

    TextStyle detailsStyle =
        TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: appAccent);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      onLongPress: () {
        Share.share(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: SizedBox(
        width: 60,
        child: Row(
          children: [
            Icon(
              Icons.mode_comment_outlined,
              color: appAccent,
            ),
            const SizedBox(width: 10,),
            Text(widget.commentsCount, style: detailsStyle),
          ],
        ),
      ),
    );
  }
}
