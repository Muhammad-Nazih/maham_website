import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Light grey background
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLinksRow(),
          SizedBox(height: 12),
          Text(
            '© 2025 Maham. All Rights Reserved',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLinksRow() {
    final links = [
      'Usage conditions',
      'Terms and conditions',
      'Privacy policy',
      'Jobs applications',
      'Contact us',
      'Bazooka franchise',
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (int i = 0; i < links.length; i++) ...[
          buildLink(links[i]),
          if (i != links.length - 1)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 12,
                width: 1,
                color: Colors.grey,
              )),
        ]
      ],
    );
  }

  Widget buildLink(String text) {
    return InkWell(
      onTap: () {
        // Handle link tap
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}