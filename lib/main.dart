import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mikltea/models/cart.dart';
import 'package:mikltea/models/category.dart';
import 'package:mikltea/models/product.dart';
import 'package:mikltea/screens/intro/intro_screen.dart';

late Box cart;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CategoryAdapter());

  runApp(const ProviderScope(child: MyApp()));
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
