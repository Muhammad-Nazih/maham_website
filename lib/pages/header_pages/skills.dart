import 'package:flutter/material.dart';
import 'package:maham_website/widgets/master_layout.dart';

class Skills extends StatelessWidget {
  final String language;
  const Skills({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      child: Center(
        child: Text(
          'Skills',
          style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
        ),
      ),
    );
  }
}
