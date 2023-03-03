import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:milktea/layout.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:milktea/model/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());

  await Hive.openBox<CartModel>('CART_BOX');

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void dispose() {
    Hive.box('CART_BOX').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme),
        fontFamily: 'Oswald',
      ),
      routerConfig: router,
    );
  }
}
