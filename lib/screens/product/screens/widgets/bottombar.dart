import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../cart/screens/cart_screens.dart';
import '../../provider/tab_provider.dart';
import '../home_screens.dart';
import '../menu_screens.dart';


class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar>{
  int indexTab = 0;
  void _onItemTapped(int index) {
    ref.read(tabProvider.notifier).TabClick(index);
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => MenuProduct()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        break;
    }
    // setState(() { indexTab = index; });
  }
  @override
  Widget build(BuildContext context) {
    final tabState = ref.watch(tabProvider);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.storefront),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books_sharp),
          label: 'Đơn Hàng',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_sharp),
          label: 'Tài khoản',
        ),
      ],
      unselectedItemColor: Color(0xFF808089),
      currentIndex: tabState.tabindex,
      selectedItemColor: Color(0xFFFB9116),
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 15,
      selectedFontSize: 15,
      onTap: _onItemTapped,
    );
  }
}