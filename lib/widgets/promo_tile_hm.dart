import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoTileHm extends StatefulWidget {
  @override
  _PromoTileHmState createState() => _PromoTileHmState();

  Feed? feed;
  String commentsCount;
  String lastCommentTime;
  String lastCommentLink;

  PromoTileHm(
      {Key? key,
      required this.feed,
      required this.commentsCount,
      required this.lastCommentTime,
      required this.lastCommentLink})
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
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle detailsStyle = TextStyle(
        color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.w500);

    TextStyle lastCommentTimeStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 5),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      onLongPress: () {
        Share.share(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.lastCommentTime.trim(),
              style: lastCommentTimeStyle,
            ),
            SizedBox(
              height: 40,
              width: 75,
              child: TextButton(
                onPressed: () {
                  _launchBrowser(widget.lastCommentLink);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.mode_comment_outlined,
                      size: 18,
                      color: Theme.of(context)
                          .textTheme
                          .headline6!
                          .color!
                          .withOpacity(0.8),
                    ),
                    Text(widget.commentsCount, style: detailsStyle),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).cardTheme.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
