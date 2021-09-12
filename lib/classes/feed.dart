import 'package:jiffy/jiffy.dart';

class Feed {

  final String title;
  final String link;
  final String data;

  Feed({required this.title, required this.link, required this.data});

  get formattedDate{
    return Jiffy(data).format("dd/MM/yyyy");
  }

  @override
  String toString() {
    return 'Feed{title: $title, link: $link, data: $data}';
  }
}