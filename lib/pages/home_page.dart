import 'package:flutter/material.dart';
import 'package:maham_website/constants/colors.dart';
import 'package:maham_website/constants/nav_Items.dart';
import 'package:maham_website/constants/size.dart';
import 'package:maham_website/styles/style.dart';
import 'package:maham_website/widgets/drawer_mobile.dart';
import 'package:maham_website/widgets/header_desktop.dart';
import 'package:maham_website/widgets/header_mobile.dart';
import 'package:maham_website/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer:
              constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //MAIN
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hi There, This is Maham Business Process Management Website',
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Get In Touch'),
                        ),
                      ],
                    ),
                    Image.asset('assets/images/1.png', width: screenWidth / 2),
                  ],
                ),
              ),
              //SKILLS
              Container(
                width: double.maxFinite,
                height: 500.0,
                color: Colors.blueGrey,
              ),
              //PROJECTS
              Container(width: double.maxFinite, height: 500.0),
              //CONTACT
              Container(
                width: double.maxFinite,
                height: 500.0,
                color: Colors.blueGrey,
              ),
              //FOOTER
              Container(width: double.maxFinite, height: 500.0),
            ],
          ),
        );
      },
    );
  }
}
