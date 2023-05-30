import 'package:flutter/material.dart';

class NavigationItem {
  final String label;
  final int index;
  final IconData icon;
  final Widget section;

  const NavigationItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.section,
  });
}