import 'package:flutter/material.dart';
import 'package:maham_website/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
                height: screenHeight,
                constraints: BoxConstraints(minHeight: 560.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/1.png',
                      width: screenWidth,
                      height: screenHeight / 2.5,
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'Hi There, \nThis is Maham Business \nProcess Management Website',
                      maxLines: 3,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.scaffoldBg,
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 190.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Get In Touch',
                          style: TextStyle(color: CustomColor.whitePrimary),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}