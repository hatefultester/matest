
import 'package:flutter/material.dart';
import 'package:matest/presentation/core/responsive.dart';

class NavigationLogo extends StatelessWidget {
  const NavigationLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontWeight: FontWeight.w100,
      fontSize: context.isDesktop ? 32 : 20,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.developer_mode, size: 32),
        ),
        Text("Matest", style: textStyle),
      ],
    );
  }
}
