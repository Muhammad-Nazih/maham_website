import 'package:flutter/material.dart';
import 'package:maham_website/styles/style.dart';
import 'package:maham_website/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Image.asset('images/logo.png')),
          SiteLogo(),
          Spacer(),
          IconButton(onPressed: onMenuTap, icon: Icon(Icons.menu, color: Colors.white,)),
          SizedBox(width: 15.0),
        ],
      ),
    );
  }
}
