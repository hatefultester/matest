import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'navigation_item.dart';
import 'scroll_provider.dart';
import 'navigation_items.dart';
import 'navigation_logo.dart';

class NavigationBarTablet extends ConsumerWidget {
  const NavigationBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.read(navigationItemsProvider);
    final scrollController = ref.read(scrollProvider);
    final size = MediaQuery.of(context).size;

    return AppBar(
      toolbarHeight: size.height,
      title: const NavigationLogo(),
      leading: const SizedBox.shrink(),
      automaticallyImplyLeading: false,
      centerTitle: false,
      leadingWidth: size.width / 20,
      actions: [
        PopupMenuButton<NavigationItem>(
          onSelected: (item) {
            scrollController.jumpTo(item.index);
          },
          itemBuilder: (BuildContext context) {
            return items.map((NavigationItem item) {
              return PopupMenuItem<NavigationItem>(
                value: item,
                child: Text(item.label),
              );
            }).toList();
          },
        ),
        SizedBox(width: size.width / 20),
      ],
    );
  }
}
