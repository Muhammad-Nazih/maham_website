import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maham_website/constants/colors.dart';
import 'package:maham_website/constants/nav_Items.dart';
import 'package:maham_website/styles/style.dart';
import 'package:maham_website/widgets/site_logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key});

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Image.asset('images/logo.png')),
          SiteLogo(onTap: () {}),
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
                Icon(Icons.translate, color: Colors.black,),
                SizedBox(width: 10.0,),
                Text('language'.tr(), style: TextStyle(color: Colors.deepOrange),),
              ],
            ),
          ),
          SizedBox(width: 30.0,),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  navTitles[i],
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
