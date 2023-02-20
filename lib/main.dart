import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mikltea/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme),
      ),
      home: const Index(),
    );
  }
}
