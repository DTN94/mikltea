import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';
import 'package:mikltea/screens/cart/screens/cart_screen.dart';
import 'package:mikltea/screens/product/screens/product_detail_screen.dart';
import 'package:mikltea/screens/product/screens/product_detail_screen.dart';
import 'package:mikltea/screens/product/widgets/productwidget.dart';
import '../../../models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int indexTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabController);
  }

  _handleTabController() {
    if (tabController.indexIsChanging) {
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

  List<Product> iproduct = [
    Product(
        id: 1,
        name: "Trà Xoài Kem Cheese",
        photo: "sp1.png",
        size: "M",
        price: 49000,
        quantity: 1),
    Product(
        id: 2,
        name: "Trà Trái Cây Nhiệt Đới",
        photo: "sp2.png",
        size: "M",
        price: 45000,
        quantity: 1),
    Product(
        id: 3,
        name: "Sữa Tươi Trân Chân Đường Đen",
        photo: "sp2.png",
        size: "L",
        price: 42000,
        quantity: 1),
    Product(
        id: 4,
        name: "Trà Vãi",
        photo: "sp1.png",
        size: "L",
        price: 42000,
        quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              child: Image.asset("assets/images/icon_cart.png",
                  fit: BoxFit.contain)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                isScrollable: true,
                dividerColor: Colors.transparent,
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelPadding:
                    const EdgeInsets.only(top: 0, left: 0, right: 5, bottom: 0),
                tabs: [
                  Tab(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: indexTab == 0
                          ? Border.all(color: Colors.white)
                          : Border.all(
                              color: const Color(0xff757575), width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: indexTab == 0
                          ? const Color(0xffFB9116)
                          : Colors.white,
                    ),
                    child: Text(
                      'Trà Sữa',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                          color:
                              indexTab == 0 ? Colors.white : const Color(0xff222222)),
                    ),
                  )),
                  Tab(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: indexTab == 1
                          ? Border.all(color: Colors.white)
                          : Border.all(
                              color: const Color(0xff757575), width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: indexTab == 1
                          ? const Color(0xffFB9116)
                          : Colors.white,
                    ),
                    child: Text(
                      'Trà Giải Nhiệt',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                          color:
                              indexTab == 1 ? Colors.white : const Color(0xff222222)),
                    ),
                  )),
                  Tab(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: indexTab == 2
                          ? Border.all(color: Colors.white)
                          : Border.all(
                              color: const Color(0xff757575), width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: indexTab == 2
                          ? const Color(0xffFB9116)
                          : Colors.white,
                    ),
                    child: Text(
                      'Các Loại Khác',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                          color:
                              indexTab == 2 ? Colors.white : const Color(0xff222222)),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    GridProduct(item: iproduct),
                    GridProduct(item: iproduct),
                    GridProduct(item: iproduct),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridProduct extends StatelessWidget {
  final List<Product> item;

  const GridProduct({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const transitionType = ContainerTransitionType.fade;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: item.length,
      itemBuilder: (context, index) => OpenContainer(
        closedColor: Colors.white,
        closedElevation: 0,
        transitionType: transitionType,
        transitionDuration: const Duration(seconds: 1),
        openBuilder: (context, _) => ProductDetail(item: item[index].id),
        closedBuilder: (context, VoidCallback openContainer) => ProductWidget(
          index: index,
          onClicked: openContainer,
          item: item,
        ),
      ),
    );
  }
}
