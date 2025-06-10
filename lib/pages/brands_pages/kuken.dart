import 'package:flutter/material.dart';

class Kuken extends StatelessWidget {
  const Kuken({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Küken',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
