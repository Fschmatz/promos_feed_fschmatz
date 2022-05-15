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

    TextStyle lastCommentStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      onLongPress: () {
        Share.share(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
      ),
      subtitle: Text(
        widget.lastCommentTime.trim(),
        style: lastCommentStyle,
      ),
      trailing: SizedBox(
        width: 60,
        child: TextButton(
          onPressed: () {
            _launchBrowser(widget.lastCommentLink);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.mode_comment_outlined,
                size: 16,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(widget.commentsCount, style: detailsStyle),
            ],
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).cardTheme.color,
            onPrimary:
                Theme.of(context).textTheme.headline6!.color!.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
