import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'maham website',
      theme: ThemeData
      .dark()
      .copyWith(textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      home: HomePage(),
    );
  }
}
