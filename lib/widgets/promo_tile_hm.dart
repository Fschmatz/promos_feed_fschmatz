import 'package:flutter/material.dart';
import 'package:promos_feed_fschmatz/classes/feed.dart';
import '../util/utils.dart';
import 'package:share_plus/share_plus.dart';

class PromoTileHm extends StatefulWidget {
  @override
  State<PromoTileHm> createState() => _PromoTileHmState();

  final Feed? feed;
  final String commentsCount;
  final String lastCommentTime;
  final String lastCommentLink;

  const PromoTileHm({super.key, required this.feed, required this.commentsCount, required this.lastCommentTime, required this.lastCommentLink});
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
    //TextStyle lastCommentTimeStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: secondaryColor);
    //Color tertiaryColor = theme.colorScheme.tertiary;
    TextStyle detailsStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: secondaryColor);

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
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
      /*
      trailing: SizedBox(
        height: 38,
        child: TextButton.icon(
          icon: Icon(
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
              side: BorderSide(color: theme.colorScheme.tertiaryContainer),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
      */
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.lastCommentTime.trim(),
            style: detailsStyle,
          ),
          Row(
            children: [
              Icon(
                Icons.mode_comment_outlined,
                size: 12,
                color: secondaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(formatNumber(widget.commentsCount), style: detailsStyle),
            ],
          )
        ],
      ),
    );
  }
}
