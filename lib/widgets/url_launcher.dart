import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static url(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}