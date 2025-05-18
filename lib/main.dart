import 'package:flutter/material.dart';
import 'package:maham_website/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maham website',
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
