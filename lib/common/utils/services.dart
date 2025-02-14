import 'package:url_launcher/url_launcher.dart';

class Services {

  // Function to open the URL's
  static Future<void> launchURL(strUrl) async {
    var url = Uri.parse(strUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Can not launch url $url ");
    }
  }
}