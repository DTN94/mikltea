import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/screens/menu/menu_detail_screen.dart';

import '../../models/product.dart';
import '../../models/product_list.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

List<Product> products = [];
List<LProduct> lproduct = [];

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: LProduct.getProductLists().length);
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    lproduct = LProduct.getProductLists();

    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          TabBar(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            isScrollable: true,
            dividerColor: Colors.transparent,
            controller: tabController,
            indicatorColor: Colors.transparent,
            tabs: lproduct.map((var e) {
              return SizedBox(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    border: tabController.index == lproduct.indexOf(e)
                        ? Border.all(color: Colors.white)
                        : Border.all(color: const Color(0xff757575), width: 1),
                    borderRadius: BorderRadius.circular(50),
                    color: tabController.index == lproduct.indexOf(e) ? const Color(0xffFB9116) : Colors.white,
                  ),
                  child: Text(
                    e.name,
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 16,
                      color: tabController.index == lproduct.indexOf(e) ? Colors.white : const Color(0xff171717),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: lproduct.map((var e) {
                return HomeView(id_list: e.id);
              }).toList(),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text('Menu'),
      actions: [
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(50)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/bag.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

class HomeView extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int id_list;
  // ignore: non_constant_identifier_names
  const HomeView({Key? key, required this.id_list}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    products = Product.getByList(widget.id_list);

    return SingleChildScrollView(
      child: Column(
        children: [
          productBestSell(context),
        ],
      ),
    );
  }

  Column productBestSell(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const MenuDetail(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 210,
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 95,
                          height: 110,
                          child: Image.asset('assets/images/products/${products[index].photo}'),
                        ),
                        Text(
                          products[index].name,
                          style: const TextStyle(fontFamily: 'Oswald', fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(products[index].price),
                          style: const TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 14,
                            color: Color(0xffFB9116),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 180,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: const Color(0xffFB9116),
            ),
            child: const Text('Xem Thêm', style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300)),
          ),
        ),
      ],
    );
  }
}
