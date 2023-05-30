import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../sections/about/about_me.dart';
import '../../sections/contact/contact.dart';
import '../../sections/projects/projects.dart';
import '../../sections/skills/skills.dart';
import '../../sections/work/work_experience.dart';
import 'navigation_item.dart';

final navigationItemsProvider = Provider<List<NavigationItem>>((ref) {
  return [
    const NavigationItem(label: 'About me', index: 0, icon: Icons.account_box_outlined, section: AboutMe(),),
    const NavigationItem(label: 'Skills', index: 1, icon: Icons.accessibility, section: Skills(),),
    const NavigationItem(label: 'Projects', index: 2, icon: Icons.code, section: Projects(),),
    const NavigationItem(label: 'Work experience', index: 3, icon: Icons.work, section: WorkExperience(),),
    const NavigationItem(label: 'Contact', index: 4, icon: Icons.contact_mail, section: Contact(),),
  ];
});