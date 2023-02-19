import 'package:flutter/material.dart';
import 'package:mikltea/screens/home/screens/home_screen.dart';
import 'package:mikltea/screens/viewDemo/view_demo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Oswald-Regular"
      ),
      home: ViewDemoScreen(),
    );
  }
}