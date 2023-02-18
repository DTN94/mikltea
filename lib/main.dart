import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:mikltea/screens/home/screens/home_screen.dart';
import 'package:mikltea/screens/viewDemo/view_demo_screen.dart';
=======
// import 'package:getwidget/getwidget.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application ha\
=======
>>>>>>> Stashed changes
        primarySwatch: Colors.blue,
        fontFamily: 'Oswald-Regular',
      ),
<<<<<<< Updated upstream
      home: ViewDemoScreen(),
    );
  }
}
=======
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Thưởng thức trà sữa ngon',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'Oswald-Medium'),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(500)),
                  hintText: 'Tìm kiếm',
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.only(left: 20,right: 10),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> Stashed changes
