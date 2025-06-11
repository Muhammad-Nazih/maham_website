import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLinksRow(context),
          const SizedBox(height: 12),
          Text(
            '© 2025 Maham. All Rights Reserved'.tr(),
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildLinksRow(BuildContext context) {
    final links = [
    {'text': 'Usage conditions', 'route': '/usage_conditions'},
    {'text': 'Terms and conditions', 'route': '/terms_and_conditions'},
    {'text': 'Privacy policy', 'route': '/privacy_policy'},
    {'text': 'Jobs applications', 'route': '/jobs_applications'},
    {'text': 'Contact us', 'route': '/contact'},
    {'text': 'franchise', 'route': '/franchise'},
  ];

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (int i = 0; i < links.length; i++) ...[
          buildLink(context, links[i]['text']!.tr(), links[i]['route']!),
          if (i != links.length - 1)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),
        ],
      ],
    );
  }

  Widget buildLink(BuildContext context, String text, String route) {
    return InkWell(
      onTap: () {
        final lang = context.locale.languageCode;
        GoRouter.of(context).go('/$lang$route');
      },
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
