import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'screens/cart/model/cart_model_hive.dart';
import 'screens/product/screens/home_screens.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelHiveAdapter());
  var box = await Hive.openBox('cart');

  // runApp(const MyApp());
  runApp(ProviderScope(child: MyApp()));
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
        primarySwatch: Colors.blue,
        fontFamily: "Oswald-Regular"
      ),
      home: ProductScreen(),
      // home: HomePage(),
    );
  }
}