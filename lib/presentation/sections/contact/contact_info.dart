

import 'package:flutter/material.dart';

class ContactInfo {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final String? subtitle;

  ContactInfo({
    required this.title,
    required this.icon,
    this.onTap,
    this.subtitle,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: Center(
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            leading: Icon(icon),
            title: Text(title),
            subtitle: subtitle != null ? Text(subtitle!) : null,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
