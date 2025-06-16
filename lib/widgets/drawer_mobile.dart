import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/core/constants/colors.dart';
import 'package:maham_website/core/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = context.locale.languageCode;
    
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ),

          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              titleTextStyle: const TextStyle(
                color: CustomColor.whitePrimary,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              leading: Icon(navIcons[i], color: CustomColor.whitePrimary),
              title: Text(getNavTitles(context)[i]),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
                switch (i) {
                  case 0:
                    context.go('/$currentLang');
                    break;
                  case 1:
                    context.go('/$currentLang/skills');
                    break;
                  case 2:
                    context.go('/$currentLang/projects');
                    break;
                  case 3:
                    context.go('/$currentLang/blog');
                    break;
                  case 4:
                    context.go('/$currentLang/contact');
                    break;
                }
              },
            ),
        ],
      ),
    );
  }
}
