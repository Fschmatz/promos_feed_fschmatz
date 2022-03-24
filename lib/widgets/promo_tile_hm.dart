import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoTileHm extends StatefulWidget {
  @override
  _PromoTileHmState createState() => _PromoTileHmState();

  Feed? feed;
  String commentsCount;
  String lastCommentLink;

  PromoTileHm({Key? key, required this.feed, required this.commentsCount, required this.lastCommentLink})
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
    TextStyle detailsStyle =
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      onLongPress: () {
        Share.share(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
      ),
      trailing: SizedBox(
        width: 70,
        child: TextButton(
          onPressed: () {
            _launchBrowser(widget.lastCommentLink);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.mode_comment_outlined,
                size: 18,
              ),
              Text(widget.commentsCount, style: detailsStyle),
            ],
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).cardTheme.color,
            onPrimary: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}



/*trailing : SizedBox(
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
      ),*/