import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matest/presentation/core/helpers/link_helper.dart';

class Contact extends ConsumerWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50.0),
        child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              ContactCard(
                contactInfo: [
                  ContactInfo(
                    title: 'LinkedIn',
                    icon: Icons.link_rounded,
                    onTap: () => ref.read(linkProvider).openLinkedIn(),
                  ),
                  ContactInfo(
                    title: 'Github',
                    icon: Icons.code,
                    onTap: () => ref.read(linkProvider).openGithub(),
                  ),
                ],
              ),
              ContactCard(
                contactInfo: [
                  ContactInfo(
                    title: 'Phone',
                    icon: Icons.phone,
                    subtitle: '+420 774 853 584',
                  ),
                  ContactInfo(
                    title: 'Email',
                    icon: Icons.email,
                    subtitle: 'grohmannmatej99@gmail.com',
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final List<ContactInfo> contactInfo;

  const ContactCard({Key? key, required this.contactInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: contactInfo.map((info) => info.build(context)).toList(),
          ),
        ),
      ),
    );
  }
}

class ContactInfo {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final String? subtitle;

  ContactInfo({
    required this.title,
    required this.icon,
    this.onTap,
    this.subtitle,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: Center(
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            leading: Icon(icon),
            title: Text(title),
            subtitle: subtitle != null ? Text(subtitle!) : null,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
