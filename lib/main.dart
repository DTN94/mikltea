import 'package:flutter/material.dart';
import 'package:mikltea/screens/home/screens/home_screen.dart';
import 'package:mikltea/screens/viewDemo/view_demo_screen.dart';

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
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application ha\
        primarySwatch: Colors.blue,
      ),
      home: ViewDemoScreen(),
    );
  }
}
