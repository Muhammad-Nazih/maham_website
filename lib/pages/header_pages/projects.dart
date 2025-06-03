import 'package:flutter/material.dart';
import 'package:maham_website/widgets/master_layout.dart';

class Projects extends StatelessWidget {
  const Projects({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      child: Center(
        child: Text(
          'Projects',
          style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
        ),
      ),
    );
  }
}
