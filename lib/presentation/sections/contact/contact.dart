import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matest/presentation/core/helpers/link_helper.dart';

import 'contact_card.dart';
import 'contact_info.dart';

class Contact extends ConsumerWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Center(
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