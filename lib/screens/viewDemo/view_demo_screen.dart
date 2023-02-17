import 'package:flutter/material.dart';
import 'package:mikltea/screens/home/screens/home_screen.dart';
class ViewDemoScreen extends StatefulWidget {
  const ViewDemoScreen({Key? key}) : super(key: key);

  @override
  State<ViewDemoScreen> createState() => _ViewDemoScreenState();
}

class _ViewDemoScreenState extends State<ViewDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Screen View demo"),
      ),
      body:SingleChildScrollView(
          child:Center(
            child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                }, child:Text("Home"))
              ],
            ),
          ),
      ),
    );
  }
}
