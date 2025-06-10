import 'package:flutter/material.dart';

class ControlLines extends StatelessWidget {
  const ControlLines({super.key, required String language});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ControlLines',
        style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold, color: Colors.deepOrange,),
      ),
    );
  }
}
