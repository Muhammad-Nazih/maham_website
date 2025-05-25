import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLinksRow(context),
          const SizedBox(height: 12),
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

  Widget buildLinksRow(BuildContext context) {
    final linkKeys = [
      'Usage conditions',
      'Terms and conditions',
      'Privacy policy',
      'Jobs applications',
      'Contact us',
      'franchise',
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (int i = 0; i < linkKeys.length; i++) ...[
          buildLink(linkKeys[i].tr()),
          if (i != linkKeys.length - 1)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),
        ]
      ],
    );
  }

  Widget buildLink(String text) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
