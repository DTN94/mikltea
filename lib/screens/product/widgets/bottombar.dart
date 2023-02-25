import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.tabController,
    required this.indexTab,
  });

  final TabController tabController;
  final int indexTab;

  @override
  Widget build(BuildContext context) {
    return GFTabBar(
      length: 4,
      controller: tabController,
      tabBarColor: Colors.white,
      shape: Border(top: BorderSide(color: Color(0xFFDEDDDD))),
      tabBarHeight: 60,
      indicatorColor: Color(0xFF808089),
      tabs: [
        Tab(
          icon: Icon(Icons.home,color: indexTab == 0?Color(0xFFFB9116):Colors.black,size: 25),
          child: Text('Home',style: TextStyle(fontSize: 14,color: indexTab == 0?Color(0xFFFB9116):Colors.black,fontWeight: FontWeight.w500,height: 0.8)),
        ),
        Tab(
          icon: Icon(Icons.storefront,color: indexTab == 1?Color(0xFFFB9116):Colors.black,size: 25),
          child: Text('Menu',style: TextStyle(fontSize: 14,color: indexTab == 1?Color(0xFFFB9116):Colors.black,height: 0.8),),
        ),
        Tab(
          icon: Icon(Icons.library_books_sharp,color: indexTab == 2?Color(0xFFFB9116):Colors.black,size: 25),
          child: Text('Đơn Hàng',style: TextStyle(fontSize: 14,color: indexTab == 2?Color(0xFFFB9116):Colors.black,height: 0.8),),
        ),
        Tab(
          icon: Icon(Icons.supervised_user_circle_sharp,color: indexTab == 3?Color(0xFFFB9116):Colors.black,size: 25),
          child: Text('Tài khoản',style: TextStyle(fontSize: 14,color: indexTab == 3?Color(0xFFFB9116):Colors.black,height: 0.8),),
        ),
      ],
    );
  }
}