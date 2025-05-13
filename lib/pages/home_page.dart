import 'package:flutter/material.dart';
import 'package:maham_website/pages/widgets/side_bar_menu.dart';
import 'package:maham_website/shared/app_colors.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSideMenu,
      body: SafeArea(child: 
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Side Menu
          Expanded(child: SideBarMenu()),

          //Main Body
          Expanded(child: Container()),
        ],
      ),),
    );
  }
}