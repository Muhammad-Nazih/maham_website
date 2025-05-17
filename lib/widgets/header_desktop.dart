import 'package:flutter/material.dart';
import 'package:maham_website/constants/colors.dart';
import 'package:maham_website/constants/nav_Items.dart';
import 'package:maham_website/styles/style.dart';
import 'package:maham_website/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.maxFinite,
            height: 60.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(onTap: () {
                  
                },),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/logo.png'),
                ),
                Spacer(),

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