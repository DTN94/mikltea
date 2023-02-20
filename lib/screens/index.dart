import 'package:flutter/material.dart';
import 'package:mikltea/screens/account/tai_khoan.dart';
import 'package:mikltea/screens/cart_detail/cart_detail.dart';

class Index extends StatefulWidget {
  const Index({super.key});
  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    Text(
      'Index 0: Home',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 1: Menu',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    CartDetail(),
    TaiKhoan(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffFB9116),
        unselectedItemColor: const Color(0xff808089),
        selectedLabelStyle: const TextStyle(fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          bottomNavIte(0, 'Home', 30, 30, "assets/images/home.png", const Color(0xffFB9116), const Color(0xff808089)),
          bottomNavIte(1, 'Menu', 30, 30, "assets/images/menu.png", const Color(0xffFB9116), const Color(0xff808089)),
          bottomNavIte(2, 'Giỏ hàng', 30, 30, "assets/images/cart.png", const Color(0xffFB9116), const Color(0xff808089)),
          bottomNavIte(3, 'Tài khoản', 30, 30, "assets/images/user.png", const Color(0xffFB9116), const Color(0xff808089)),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavIte(int index, String name, double width, double height, String image, Color color1, Color color2) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SizedBox(
          height: height,
          width: width,
          child: FittedBox(
            fit: BoxFit.cover,
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
