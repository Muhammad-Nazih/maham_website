import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contact',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
