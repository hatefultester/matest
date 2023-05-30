import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:url_launcher/url_launcher.dart';

const githubUrl = "https://github.com/hatefultester";
const linkedInUrl = "https://cz.linkedin.com/in/mat%C4%9Bj-grohmann-2a763b252";

final linkProvider = Provider<LinkHelper>((ref) => LinkHelper());

class LinkHelper {
  LinkHelper();

  openGithub() => _launchURL(githubUrl);
  openLinkedIn() => _launchURL(linkedInUrl);

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication
      );
    }
  }
}