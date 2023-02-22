import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/models/product_list.dart';

import '../../models/product.dart';

final List<String> slides = [
  'assets/images/page1/slide.png',
  'assets/images/page1/slide.png',
  'assets/images/page1/slide.png',
  'assets/images/page1/slide.png',
];

List<Product> products = [];
void _getProducts() {
  products = Product.getProducts();
}

List<LProduct> lproduct = [];
void _getProductLists() {
  lproduct = LProduct.getProductLists();
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    _getProducts();
    _getProductLists();

    final TabController tabController = TabController(length: lproduct.length, vsync: this);

    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Thưởng thức trà sữa ngon',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff252525)),
              ),
            ),
          ),
          searchBar(),
          SizedBox(
            width: double.maxFinite,
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: const Color(0xffFB9116),
              unselectedLabelColor: const Color(0xff222222),
              labelStyle: const TextStyle(fontFamily: 'Oswald', color: Color(0xffFB9116), fontSize: 15),
              unselectedLabelStyle: const TextStyle(fontFamily: 'Oswald', color: Color(0xff222222), fontSize: 15),
              tabs: lproduct.map((var e) {
                return SizedBox(
                  width: 80,
                  height: 40,
                  child: Center(
                    child: Text(e.name),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: lproduct.map((var e) {
                return HomeView(id_list: e.id);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
          )
        ],
      ),
      margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Tìm kiếm',
          hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff7A7D8A), fontWeight: FontWeight.w300),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/images/search.svg'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          ClipPath(
            clipper: const ShapeBorderClipper(shape: CircleBorder()),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/images/avatar.jpg',
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Xin Chào ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Oswald', color: Color(0xff656565)),
          ),
          const Text(
            'Huu Tho !',
            style: TextStyle(fontSize: 14, color: Color(0xff656565)),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: const Color(0xffFFF5EB), borderRadius: BorderRadius.circular(50)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/heart.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: const Color(0xffFFF5EB), borderRadius: BorderRadius.circular(50)),
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
  int currentPos = 0;
  final CarouselController slideController = CarouselController();

  @override
  Widget build(BuildContext context) {
    products = Product.getByList(widget.id_list);

    return SingleChildScrollView(
      child: Column(
        children: [
          slideView(),
          const SizedBox(height: 25),
          productNoibat(),
          const SizedBox(height: 30),
          productBestSell(context),
        ],
      ),
    );
  }

  Column productBestSell(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best Seller',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 17, fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Xem tất cả',
                        style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xffFB9116)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Column productNoibat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Phổ Biến Nhất',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 17, fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Xem tất cả',
                        style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xffFB9116)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 160,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                decoration: BoxDecoration(
                  color: Color(products[index].boxcolor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 95,
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('assets/images/products/${products[index].photo}'),
                      ),
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
              );
            },
          ),
        )
      ],
    );
  }

  Column slideView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 15, bottom: 20),
            child: CarouselSlider(
              carouselController: slideController,
              items: slides
                  .map(
                    (url) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(url),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 150,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                },
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: slides.asMap().entries.map((entry) {
            return GestureDetector(
              child: Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPos == entry.key ? const Color(0xffFB9116) : const Color(0xffD9D9D9),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
