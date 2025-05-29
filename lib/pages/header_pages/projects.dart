import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Projects',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
