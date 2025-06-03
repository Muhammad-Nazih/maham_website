import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/constants/colors.dart';
import 'package:maham_website/constants/components.dart';
import 'package:maham_website/constants/nav_items.dart';
import 'package:maham_website/pages/header_pages/blog.dart';
import 'package:maham_website/pages/header_pages/contact.dart';
import 'package:maham_website/pages/header_pages/projects.dart';
import 'package:maham_website/pages/header_pages/skills.dart';
import 'package:maham_website/styles/style.dart';
import 'package:maham_website/widgets/site_logo.dart';
import 'dart:html' as html;

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = context.locale.languageCode;
    return Container(
      width: double.infinity,
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {
              context.go('/$currentLang');
            },
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () async {
              final currentLocale = context.locale;
              final newLocale =
                  currentLocale.languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en');

              // Get current route location
              final currentLocation = GoRouterState.of(context).uri.path;

              // Replace the language part in the path
              final newPath = currentLocation.replaceFirst(
                '/${currentLocale.languageCode}',
                '/${newLocale.languageCode}',
              );

              // Change locale and navigate to the same path but with new language
              context.setLocale(newLocale);
              await Future.delayed(const Duration(milliseconds: 50));
              context.go(newPath);
            },
            child: Row(
              children: [
                Icon(Icons.translate, color: Colors.black),
                SizedBox(width: 10.0),
                Text(
                  'language'.tr(),
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          SizedBox(width: 30.0),
          for (int i = 0; i < getNavTitles(context).length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                onPressed: () {
                  final lang = context.locale.languageCode;
                  switch (i) {
                    case 0: // Home
                      context.go('/$lang');
                      break;
                    case 1: // Skills
                      context.go('/$lang/skills');
                      break;
                    case 2: // Projects
                      context.go('/$lang/projects');
                      break;
                    case 3: // Blog
                      context.go('/$lang/blog');
                      break;
                    case 4: // Contact
                      context.go('/$lang/contact');
                      break;
                  }
                },
                child: Text(
                  getNavTitles(context)[i],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
