import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mikltea/screens/home/screens/home_screen.dart';
import 'package:mikltea/screens/viewDemo/view_demo_screen.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: ViewDemoScreen(),
    );
  }
}

