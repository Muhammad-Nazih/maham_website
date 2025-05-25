import 'package:flutter/material.dart';
import 'package:maham_website/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('images/maham_logo.png'),
          ),
          Text(
            'MAHAM',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              // decoration: TextDecoration.underline,
              color: CustomColor.whitePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
