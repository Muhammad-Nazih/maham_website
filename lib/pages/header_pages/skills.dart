import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  final String language;
  const Skills({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Skills',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
