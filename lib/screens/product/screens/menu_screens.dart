import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mikltea/screens/product/widgets/product_widget.dart';

class MenuProduct extends StatefulWidget {
  const MenuProduct({Key? key}) : super(key: key);

  @override
  State<MenuProduct> createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> with TickerProviderStateMixin{

  late TabController tabController;
  int indexTab = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
      appBar:AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leadingWidth: 50,
        leading:Center(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 30,
            height: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.cover),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Menu',style: TextStyle(fontSize: 18,fontFamily: 'Oswald-Medium', color: Colors.black),),
            ElevatedButton(
                onPressed: null,
                child: IconButton(onPressed: null, icon: Icon(Icons.shopping_bag, size: 20)),
            ),
          ],
        ),
      ) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              GFTabBar(
                length: 3,
                tabBarColor: Colors.transparent,
                controller: tabController,
                isScrollable: true,
                tabBarHeight: 36,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                  color: Color(0xffFB9116),
                  borderRadius: BorderRadius.circular(500),
                ),
                // labelStyle: ,
                tabs: [
                  Tab(
                    child: Text('Trà Sữa',
                      style: TextStyle(fontSize: 14,fontFamily: 'Oswald-Medium', color: indexTab == 0? Colors.white:Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text('Trà Trái cây',
                      style: TextStyle(fontSize: 14,fontFamily: 'Oswald-Medium', color: indexTab == 1? Colors.white:Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text('Nước ép',
                      style: TextStyle(fontSize: 14,fontFamily: 'Oswald-Medium', color: indexTab == 2? Colors.white:Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              IndexedStack(
                index: indexTab,
                children: [
                  Visibility(
                    visible: true,
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        children: [
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                          ItemProduct(),
                        ],
                      ),
                  ),
                  Visibility(
                    visible: true,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      children: [
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      children: [
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                        ItemProduct(),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
