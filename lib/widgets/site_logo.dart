import 'package:flutter/material.dart';
import 'package:maham_website/core/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image.asset('images/maham_logo.png',
            width: 40.0,
            height: 40.0,
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
      ),
    );
  }
}
