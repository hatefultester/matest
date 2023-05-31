import 'package:flutter/material.dart';

import 'about_me_info.dart';

class AboutMeInfoTile extends StatelessWidget {
  final AboutMeInfo item;
  final bool isMobile;

  const AboutMeInfoTile({Key? key, required this.item, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                    fontSize: isMobile ? 20 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                item.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
