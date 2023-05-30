import 'package:flutter/material.dart';
import 'package:matest/presentation/core/responsibility/responsive_extension.dart';

class AboutMeInfo {
  final String title;
  final String asset;
  final String description;

  const AboutMeInfo({
    required this.asset,
    required this.title,
    required this.description,
  });
}

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AboutMeInfo> aboutMeInfoList = [
      const AboutMeInfo(
        asset: 'assets/images/me.jpg',
        title: 'Flutter developer',
        description: 'Passionate about creating cross-platform mobile apps with Flutter.',
      ),
      const AboutMeInfo(
        asset: 'assets/images/tester.jpg',
        title: 'Software Tester',
        description: 'Experienced and critical thinker that ensures the quality of software delivery.',
      ),
      const AboutMeInfo(
        asset: 'assets/images/cuber.png',
        title: 'Speedcuber',
        description: 'Holder of 13 Czech records in Rubik\'s Cube, showing passion and dedication.',
      ),
    ];

    List<Widget> _items = [
    for (final item in aboutMeInfoList)
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.green,
                    ],
                  ),
                ),
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 1000),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(item.asset),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Center(
                  child: Text(
                    item.title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: context.isMobile ? 20 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: context.isMobile ? 16 : 20,
                  ),
                ),
              ),
              ],
          ),
        ),
        ),
    ];

    if (context.isMobile || context.isTablet || !context.isDesktop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: _items,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _items,
        ),
      );
    }
  }
}
