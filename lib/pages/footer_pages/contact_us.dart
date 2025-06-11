import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contact Us',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
