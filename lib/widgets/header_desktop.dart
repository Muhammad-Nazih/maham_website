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
    return Container(
      width: double.infinity,
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {
              html.window.location.reload();
            },
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              final currentLocale = context.locale;
              final newLocale =
                  currentLocale.languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en');
              context.setLocale(newLocale);
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
                  if (i == 0) {
                    html.window.location.reload();
                  } else if (i == 1) {
                    final lang =
                        context.locale.languageCode; // أو أي طريقة تجيب اللغة
                    context.go('/$lang/skills');
                  } else if (i == 2) {
                    final lang =
                        context.locale.languageCode; 
                    context.go('/$lang/projects');
                  } else if (i == 3) {
                    final lang =
                        context.locale.languageCode; 
                    context.go('/$lang/blog');
                  } else if (i == 4) {
                    final lang =
                        context.locale.languageCode; 
                    context.go('/$lang/contact');
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
