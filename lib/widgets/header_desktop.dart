import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/core/constants/colors.dart';
import 'package:maham_website/core/constants/components.dart';
import 'package:maham_website/core/constants/nav_items.dart';
import 'package:maham_website/core/utils/dio_helper.dart';
import 'package:maham_website/pages/header_pages/blog.dart';
import 'package:maham_website/pages/header_pages/contact.dart';
import 'package:maham_website/pages/header_pages/projects.dart';
import 'package:maham_website/pages/header_pages/skills.dart';
import 'package:maham_website/core/styles/style.dart';
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
              final newLocale =
                  context.locale.languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en');

              // 1. Get current path and prepare new path
              final currentPath = GoRouterState.of(context).uri.path;
              final newPath = currentPath.replaceFirst(
                '/${context.locale.languageCode}',
                '/${newLocale.languageCode}',
              );

              // 2. Change the locale FIRST to trigger rebuild
              await context.setLocale(newLocale);

              // ✅ هنا: علشان اللغة تتبعت في كل طلب
              DioHelper.currentLanguage = newLocale.languageCode;
              
              // 3. Wait for the next frame to ensure widgets rebuilt
              await Future.delayed(Duration.zero);

              // 4. Update the URL without triggering rebuild
              context.go(newPath);
            },
            child: Row(
              children: [
                Icon(Icons.language, color: Colors.black),
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
