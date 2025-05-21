import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Light grey background
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLinksRow(),
          SizedBox(height: 12),
          Text(
            '© 2025 Maham. All Rights Reserved'.tr(),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLinksRow() {
    final links = [
      'Usage conditions'.tr(),
      'Terms and conditions'.tr(),
      'Privacy policy'.tr(),
      'Jobs applications'.tr(),
      'Contact us'.tr(),
      'franchise'.tr(),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (int i = 0; i < links.length; i++) ...[
          buildLink(links[i]),
          if (i != links.length - 1)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 12,
                width: 1,
                color: Colors.grey,
              )),
        ]
      ],
    );
  }

  Widget buildLink(String text) {
    return InkWell(
      onTap: () {
        // Handle link tap
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}