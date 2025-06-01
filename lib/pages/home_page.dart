import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maham_website/constants/size.dart';
import 'package:maham_website/widgets/drawer_mobile.dart';
import 'package:maham_website/widgets/footer.dart';
import 'package:maham_website/widgets/header_desktop.dart';
import 'package:maham_website/widgets/header_mobile.dart';
import 'package:maham_website/widgets/main_desktop.dart';
import 'package:maham_website/widgets/main_mobile.dart';
import 'package:maham_website/widgets/scrolling_brands.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String language});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer:
              constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(),
          body: Stack(
            children: [
              // Background image
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/home_page_bGround.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Main content over the background
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    HeaderDesktop()
                  else
                    HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),

                  if (constraints.maxWidth >= kMinDesktopWidth)
                    MainDesktop(key: ValueKey(context.locale.languageCode))
                  else
                    MainMobile(key: ValueKey(context.locale.languageCode)),

                  ScrollingBrandsBanner(
                    key: ValueKey(context.locale.languageCode),
                  ),

                  Footer(key: ValueKey(context.locale.languageCode)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
