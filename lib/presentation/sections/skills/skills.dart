import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:matest/presentation/core/responsibility/responsive_extension.dart';

class Skill {
  final String title;
  final String description;
  final String? detail;

  Skill({required this.title, required this.description,  this.detail, });
}

class SkillCard extends StatelessWidget {
  final Skill skill;
  final bool isMobile;

  const SkillCard({Key? key, required this.skill, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        margin: const EdgeInsets.all(8),
        child: InkWell(
          onTap: skill.detail == null ? null : () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(skill.title),
              content: Text(skill.detail!),
              actions: <Widget>[
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  skill.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12,),
                Text(
                  skill.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Skill> skills = [
      Skill(
        title: 'Cross-platform application development',
        description: 'I can make cross-platform applications using Flutter. I have build several applications for Android, iOS, macOS and web.',
      ),
      Skill(
        title: 'Firebase Integration',
        description: 'I know how to integrate and use Firebase. In a past I have used Firebase for authentication, analytics, database, and hosting.',
      ),
      Skill(
        title: 'App monetization',
        description: 'I know how to integrate ads with AdMob and successfully monetize applications.',
      ),
      Skill(
        title: 'CI/CD Pipeline Setup',
        description: 'I know how to setup CI/CD pipeline using Bitrise for Flutter and native Android and iOS apps.',
      ),
      Skill(
        title: 'Mobile Application Testing',
        description: 'I know how to test Android and iOS applications that are both native and Flutter made. I can test your application too.',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom:24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text( '\nWhat I can do for you?',
            style: TextStyle(
              fontSize: context.isMobile ? 20 : 30,
              fontWeight: FontWeight.bold,
            ),),
          const SizedBox(height: 24,),
          CarouselSlider.builder(
            itemCount: skills.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SkillCard(skill: skills[i], isMobile: context.isMobile,),
            ),
            options: CarouselOptions(
              viewportFraction: 0.4,
              height: 400,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          )
        ],
      ),
    );
  }
}
