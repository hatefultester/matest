import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matest/presentation/core/navigation/navigation_action_button.dart';
import 'package:matest/presentation/core/navigation/navigation_items.dart';
import 'navigation_logo.dart';

class NavigationBarDesktop extends ConsumerWidget {
  const NavigationBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.read(navigationItemsProvider);
    final size = MediaQuery.of(context).size;

    return AppBar(
      toolbarHeight: size.height,
      title:
      const NavigationLogo(),
      leading: const SizedBox.shrink(),
      automaticallyImplyLeading: false,
      centerTitle: false,
      leadingWidth: size.width/20,
      actions: [
          for (final item in items)
            NavigationActionButton(label: item.label, index: item.index),
        SizedBox(width: size.width/20),
        ],
    );
  }
}
