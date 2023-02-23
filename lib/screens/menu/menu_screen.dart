import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/screens/menu/menu_detail_screen.dart';

import '../../controllers/category.dart';
import '../../controllers/product.dart';
import '../../models/category.dart';
import '../../models/product.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late Future<List<Category>> _categoryList;

  late TabController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _categoryList = fetchCategory();
    _tabController = TabController(vsync: this, length: 6, initialIndex: 0);
    // _tabController.addListener(() {
    //   if (_tabController.indexIsChanging) {
    //     setState(() {
    //       _selectedTab = _tabController.index;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Material(
        child: FutureBuilder<List<Category>>(
          future: _categoryList,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (!snapshot.hasData) return const CircularProgressIndicator();

            if (snapshot.hasData) {
              _tabController = TabController(vsync: this, length: snapshot.data!.length);
              // _tabController.addListener(() {
              //   if (_tabController.indexIsChanging) {
              //     setState(() {
              //       _selectedTab = _tabController.index;
              //     });
              //   }
              // });
            }
            print('tAb:' + _selectedTab.toString());

            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Align(
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
                            tabs: snapshot.data!.map((var e) {
                              //print(snapshot.data!.indexOf(e));
                              return Container(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  border: _selectedTab == snapshot.data!.indexOf(e) ? Border.all(color: Colors.white, width: 0) : Border.all(color: const Color(0xff757575), width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                  color: _selectedTab == snapshot.data!.indexOf(e) ? const Color(0xffFB9116) : Colors.white,
                                ),
                                child: Text(
                                  e.name,
                                  style: TextStyle(
                                    fontFamily: 'Oswald',
                                    fontSize: 16,
                                    color: _selectedTab == snapshot.data!.indexOf(e) ? Colors.white : const Color(0xff171717),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: snapshot.data!.map((var e) {
                              print(e.id);
                              return MenuView(id_list: e.id);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
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
  MenuView({Key? key, required this.id_list}) : super(key: key);
  // ignore: non_constant_identifier_names
  final int id_list;

  final Future<List<Product>> _productList = fetchProduct();

  @override
  Widget build(BuildContext context) {
    print('id:' + id_list.toString());
    return SingleChildScrollView(
      child: FutureBuilder<List<Product>>(
        future: _productList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Product> visibleWidgets = snapshot.data!.where((idCategory) => idCategory.category.id == id_list).toList();
            return buildColumn(visibleWidgets, context);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  buildColumn(List<Product> products, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        SizedBox(
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
        const SizedBox(height: 30),
        /* SizedBox(
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
        ), */
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
              child: CachedNetworkImage(
                imageUrl: (Uri.tryParse(product.images.first)!.hasAbsolutePath == true) ? product.images.first : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                placeholder: (context, url) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [CircularProgressIndicator()],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              product.title,
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
