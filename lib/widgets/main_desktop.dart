import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maham_website/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'main_title'.tr(),
                  maxLines: 3,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.scaffoldBg,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {},
                    child: Text(
                      'get_in_touch'.tr(),
                      style: const TextStyle(color: CustomColor.whitePrimary),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset('images/1.png', width: screenWidth / 2)),
        ],
      ),
    );
  }
}
