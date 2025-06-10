import 'package:flutter/material.dart';

class Codelytical extends StatelessWidget {
    final String language;

  const Codelytical({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Codelytical',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
