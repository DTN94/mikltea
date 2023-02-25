import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mikltea/screens/product/screens/menu_screens.dart';
import 'package:mikltea/screens/product/screens/product_screens.dart';
import '../../order/screens/order_screens.dart';

class HomePageProduct extends StatefulWidget {
  const HomePageProduct({Key? key}) : super(key: key);

  @override
  State<HomePageProduct> createState() => _HomePageProductState();
}

class _HomePageProductState extends State<HomePageProduct> with TickerProviderStateMixin{
  late TabController tabController;
  int indexTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(_handleTabController);
  }
  _handleTabController(){
    if(tabController.indexIsChanging){
      setState(() {
        indexTab = tabController.index;
      });
    }
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GFTabBarView(controller: tabController, children: <Widget>[
        Container(
          child: ProductScreen(),
        ),
        Container(
          child: MenuProduct(),
        ),
        Container(
          child: OrderPage(),
        ),
        Container(color: Colors.blue)
      ]),
      bottomNavigationBar: GFTabBar(
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
      ),
    );
  }
}
