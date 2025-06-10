import 'package:flutter/material.dart';

class ProGuard extends StatelessWidget {
  const ProGuard({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ProGuard',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
