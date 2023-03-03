import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:milktea/screen/account_screen.dart';
import 'package:milktea/screen/home_screen.dart';
import 'package:milktea/screen/product_screen.dart';
import 'package:milktea/screen/widget/nav_button_widget.dart';

final _bottomNavProvider = StateProvider((ref) => 0);

class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  static List<Widget> _widgetOptions = [
    HomeScreen(),
    ProductScreen(),
    Text('Order'),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNav = ref.watch(_bottomNavProvider);

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: _widgetOptions.elementAt(selectedNav),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavButton(selectedNav: selectedNav, idx: 0, svgIcon: 'assets/icon/home.svg', name: 'Home', bottomNavProvider: _bottomNavProvider),
              NavButton(selectedNav: selectedNav, idx: 1, svgIcon: 'assets/icon/menu.svg', name: 'Menu', bottomNavProvider: _bottomNavProvider),
              NavButton(selectedNav: selectedNav, idx: 2, svgIcon: 'assets/icon/order.svg', name: 'Giỏ hàng', bottomNavProvider: _bottomNavProvider),
              NavButton(selectedNav: selectedNav, idx: 3, svgIcon: 'assets/icon/user.svg', name: 'Tài khoản', bottomNavProvider: _bottomNavProvider),
            ],
          ),
        ),
      ),
    );
  }
}
