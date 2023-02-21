import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mikltea/screens/intro/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme),
        fontFamily: 'Oswald',
      ),
      home: const Intro(),
    );
  }
}
