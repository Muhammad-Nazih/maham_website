import 'package:flutter/material.dart';
import 'package:maham_website/core/constants/colors.dart';
import 'package:maham_website/core/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
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
                  icon: Icon(Icons.close),
                ),
              ),
            ),
            for (int i = 0; i < navIcons.length; i++)
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                titleTextStyle: TextStyle(
                  color: CustomColor.whitePrimary,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                leading: Icon(navIcons[i]),
                title: Text(getNavTitles(context)[i]),
              ),
          ],
        ),
      );
  }
}