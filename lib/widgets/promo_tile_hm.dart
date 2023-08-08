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

  String formatNumber(String numberStr) {
    int number = int.parse(numberStr.replaceAll('.', ''));
    if (number > 999) {
      int thousands = (number / 1000).floor();
      return '$thousands' 'k+';
    } else {
      return number.toString();
    }
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
        fontSize: 12,
        fontWeight: FontWeight.w500);

    TextStyle lastCommentTimeStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.secondary);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
      onTap: () {
        _launchBrowser(widget.feed!.link!);
      },
      onLongPress: () {
        Share.share(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
        style: const TextStyle(fontSize: 15),
      ),
      trailing: SizedBox(
        height: 38,
        width: 68,
        child: TextButton(
          onPressed: () {
            _launchBrowser(widget.lastCommentLink);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.mode_comment_outlined,
                size: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(formatNumber(widget.commentsCount), style: detailsStyle),
            ],
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).dividerTheme.color!),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
      subtitle: Text(
        widget.lastCommentTime.trim(),
        style: lastCommentTimeStyle,
      ),
    );
  }
}
