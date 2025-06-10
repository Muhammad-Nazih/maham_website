import 'package:flutter/material.dart';

class Cartel extends StatelessWidget {
  const Cartel({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cartel',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
