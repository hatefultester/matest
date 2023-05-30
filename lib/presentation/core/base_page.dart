import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../core/responsive.dart';
import 'navigation/scroll_provider.dart';
import 'navigation/navigation_bar_desktop.dart';
import 'navigation/navigation_bar_mobile.dart';
import 'navigation/navigation_bar_tablet.dart';
import 'navigation/navigation_items.dart';

class BasePage extends ConsumerWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(navigationItemsProvider);
    final scrollController = ref.read(scrollProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: Responsive(
          mobile: NavigationBarMobile(),
          desktop: NavigationBarDesktop(),
          tablet: NavigationBarTablet(),
        ),
      ),
      drawer: NavigationDrawer(
        elevation: 0,
        onDestinationSelected: (index) {
          scrollController.jumpTo(index);
          Navigator.pop(context);
        },
        selectedIndex: null,
        children: [
          for (final item in items)
            NavigationDrawerDestination(
              icon: Icon(item.icon),
              label: Text(item.label),
            ),
        ],
      ),
      body: ScrollablePositionedList.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) => items[index].section,
        itemScrollController: scrollController.itemScrollController,
      ),
    );
  }
}
