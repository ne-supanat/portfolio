import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactContent extends StatelessWidget {
  const ContactContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contactEmail(context),
          contactPhone(context),
          contactGithub(context),
          contactResume(context),
          contactKofi(context),
        ],
      ),
    );
  }

  Widget contactEmail(BuildContext context) {
    final email = "naesup@gmail.com";
    return contactItem(context, icon: Icon(Icons.email_rounded), text: email, url: "mailto:$email");
  }

  Widget contactPhone(BuildContext context) {
    final phone = "+66936704299";
    return contactItem(context, icon: Icon(Icons.phone_rounded), text: phone, url: "tel:$phone");
  }

  Widget contactGithub(BuildContext context) {
    final git = "ne-supanat";
    return contactItem(
      context,
      icon: ImageIcon(AssetImage('assets/icons/icon_github.png')),
      text: git,
      url: "https://github.com/$git",
    );
  }

  Widget contactResume(BuildContext context) {
    return contactItem(
      context,
      icon: Icon(Icons.insert_drive_file_rounded),
      text: "Resume",
      url: "https://drive.google.com/file/d/1GOcItr2xKtvtbJgaxsyZLBOVQ5bYCHiS/view?usp=sharing",
    );
  }

  Widget contactKofi(BuildContext context) {
    return contactItem(
      context,
      icon: Image.asset('assets/icons/icon_kofi.png', width: 24),
      text: "Ko-fi",
      url: "https://ko-fi.com/nheetial",
    );
  }

  Widget contactItem(
    BuildContext context, {
    required Widget icon,
    required String text,
    required String url,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        icon,
        InkWell(
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline),
          ),
          onTap: () => launchUrl(Uri.parse(url)),
        ),
      ],
    );
  }
}
