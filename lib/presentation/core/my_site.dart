import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import 'base_page.dart';

class MySite extends ConsumerWidget {
  const MySite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Matěj Grohmann - Portfolio',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Montserrat',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
          ),
          home: const BasePage(),
        );
      },
    );
  }
}
