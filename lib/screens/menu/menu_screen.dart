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

List<LProduct> lproduct = [];

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: LProduct.getProductLists().length);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedTab = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    lproduct = LProduct.getProductLists();

    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                isScrollable: true,
                dividerColor: Colors.transparent,
                controller: _tabController,
                indicatorColor: Colors.transparent,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(right: 10),
                indicatorWeight: 4,
                tabs: lproduct.map((var e) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: _selectedTab == lproduct.indexOf(e) ? Border.all(color: Colors.white, width: 0) : Border.all(color: const Color(0xff757575), width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: _selectedTab == lproduct.indexOf(e) ? const Color(0xffFB9116) : Colors.white,
                    ),
                    child: Text(
                      e.name,
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 16,
                        color: _selectedTab == lproduct.indexOf(e) ? Colors.white : const Color(0xff171717),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: lproduct.map((var e) {
                return MenuView(id_list: e.id);
              }).toList(),
            ),
          ),
          const SizedBox(height: 30)
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

class MenuView extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const MenuView({Key? key, required this.id_list}) : super(key: key);
  // ignore: non_constant_identifier_names
  final int id_list;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<Product>>(
        future: Product.getByListAsync(id_list),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildColumn(snapshot.data!, context);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Column buildColumn(List<Product> products, BuildContext context) {
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
              itemCount: (products.isNotEmpty) ? products.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return productCard(context, products[index]);
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

  productCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MenuDetail(id: product.id),
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
              child: Image.asset('assets/images/products/${product.photo}'),
            ),
            Text(
              product.name,
              style: const TextStyle(fontFamily: 'Oswald', fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff222222)),
            ),
            Text(
              NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(product.price),
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
  }
}
