import 'package:flutter/material.dart';
import 'package:mikltea/screens/home/screens/demo.dart';
import 'package:mikltea/screens/home/screens/home_screen.dart';

import '../home/screens/cart.dart';
import '../home/screens/create account.dart';

import '../home/screens/login.dart';
import '../home/screens/order susses.dart';
import '../home/screens/request summary.dart';
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

                }, child:Text("Home")),

                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartSceen()));

                }, child:Text("CartSceen")),

                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSusses()));

                }, child:Text("OrderSusses")),
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Request()));

                }, child:Text("Request")),
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

                }, child:Text("Login")),
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Create()));

                }, child:Text("Create")),
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Demo()));

                }, child:Text("Demo")),


              ],
            ),
          ),
      ),
    );
  }
}
