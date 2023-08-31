import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail(String email) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=Hello&body=Hi, I hope you are doing well!',
  );
  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    throw 'Could not launch email';
  }
}
