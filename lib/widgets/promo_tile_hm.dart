import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/utils.dart';

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
  final Utils utils = Utils();

  @override
  void initState() {
    super.initState();

    promoTitle = widget.feed!.title!;
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color secondaryColor = theme.colorScheme.secondary;
    Color tertiaryColor = theme.colorScheme.tertiary;

    TextStyle detailsStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: tertiaryColor );

    TextStyle lastCommentTimeStyle = TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: secondaryColor);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 4, 12, 4),
      onTap: () {
        utils.launchBrowser(widget.feed!.link!);
      },
      onLongPress: () {
        Share.share(widget.feed!.link!);
      },
      title: Text(
        promoTitle,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 15),
      ),
      trailing: SizedBox(
        height: 38,
        child: TextButton.icon(
          icon:  Icon(
            Icons.mode_comment_outlined,
            size: 16,
            color: tertiaryColor,
          ),
          onPressed: () {
            utils.launchBrowser(widget.lastCommentLink);
          },
          label: Text(formatNumber(widget.commentsCount), style: detailsStyle),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: theme.colorScheme.secondaryContainer),
              borderRadius: BorderRadius.circular(25),
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
