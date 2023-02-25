import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title:Text("Home Screen"),
        ) ,
        body:SingleChildScrollView(
          child:Column(
            children: [
              Center(
                child:Text("Home body"),
              )

            ],
          ),
        ),
    );
  }
}
