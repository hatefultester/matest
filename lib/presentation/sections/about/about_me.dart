import 'package:flutter/material.dart';
import 'package:matest/presentation/core/responsibility/responsive_extension.dart';

import 'about_me_info_tile.dart';
import 'about_me_list.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<Widget> items = [
    for (final item in aboutMeInfoList)
     AboutMeInfoTile(item: item, isMobile: context.isMobile)
    ];

    if (context.isMobile || context.isTablet || !context.isDesktop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: items,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ),
      );
    }
  }
}
