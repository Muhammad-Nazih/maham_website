import 'package:flutter/material.dart';
import 'package:maham_website/widgets/master_layout.dart';

class Blog extends StatelessWidget {
  const Blog({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      child: Center(
        child: Text(
          'Blog',
          style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
        ),
      ),
    );
  }
}
