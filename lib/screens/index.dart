import 'package:flutter/material.dart';
import 'package:mikltea/screens/cart/screens/cart_screen.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    Text(
      'Home',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Menu',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    cart(),
    Text(
      'Tài Khoản',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffFB9116),
        unselectedItemColor: const Color(0xff808089),
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          bottomNavIte(0, 'Home', 25, 24, "assets/images/m_home.png",
              const Color(0xffFB9116), const Color(0xff808089)),
          bottomNavIte(1, 'Menu', 25, 24, "assets/images/m_menu.png",
              const Color(0xffFB9116), const Color(0xff808089)),
          bottomNavIte(2, 'Giỏ hàng', 25, 24, "assets/images/m_cart.png",
              const Color(0xffFB9116), const Color(0xff808089)),
          bottomNavIte(3, 'Tài khoản', 25, 24, "assets/images/m_user.png" ,
              const Color(0xffFB9116), const Color(0xff808089)),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavIte(int index, String name, double width,
      double height, String image, Color color1, Color color2) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: SizedBox(
          height: height,
          width: width,
          child: FittedBox(
            fit: BoxFit.contain,
            child: ImageIcon(
              AssetImage(image),
              color: _selectedIndex == index ? (color1) : (color2),
            ),
          ),
        ),
      ),
      label: name,
    );
  }
}
