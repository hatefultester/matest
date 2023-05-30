import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navigation_logo.dart';

class NavigationBarMobile extends ConsumerWidget {
  const NavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return AppBar(
      clipBehavior: Clip.none,
      toolbarHeight: size.height,
      title: const NavigationLogo(),
      centerTitle: false,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
    );
  }
}
