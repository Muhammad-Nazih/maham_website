import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Blog',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
