import 'package:url_launcher/url_launcher.dart';
import 'app_details.dart';

class Utils {

  openGithubRepository() {
    launchBrowser(AppDetails.repositoryLink);
  }

  launchBrowser(String url) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  }

  String capitalizeFirstLetterString(String word){
    return word.replaceFirst(word[0], word[0].toUpperCase());
  }

}