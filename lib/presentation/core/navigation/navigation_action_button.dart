

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matest/presentation/core/animations/hover_fader.dart';
import 'package:matest/presentation/core/navigation/scroll_provider.dart';

class NavigationActionButton extends ConsumerStatefulWidget {
  final String label;
  final int index;
  const NavigationActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  ConsumerState<NavigationActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends ConsumerState<NavigationActionButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.read(scrollProvider);

    // theme
    var theme = Theme.of(context);
    return HoverFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          gradient: isHover ? const LinearGradient(colors: [Colors.blue, Colors.green]) : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (value) {
            setState(() => isHover = value);
          },
          onTap: () {
            scrollController.jumpTo(widget.index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.label,
            ),
          ),
        ),
      ),
    );
  }
}
