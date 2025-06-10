import 'package:flutter/material.dart';

class Antinoopolis extends StatelessWidget {
  const Antinoopolis({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Antinoopolis',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
