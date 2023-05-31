
import 'package:flutter/material.dart';
import 'contact_info.dart';

class ContactCard extends StatelessWidget {
  final List<ContactInfo> contactInfo;

  const ContactCard({Key? key, required this.contactInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: contactInfo.map((info) => info.build(context)).toList(),
        ),
      ),
    );
  }
}