import 'package:flutter/material.dart';

class EmdadEn extends StatelessWidget {
  const EmdadEn({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Emdad',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
