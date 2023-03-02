import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/models/category.dart';
import 'package:mikltea/models/product.dart';

import '../../controllers/category.dart';
import '../../controllers/product.dart';

final List<String> slides = [
  'assets/images/page1/slide.png',
  'assets/images/page1/slide.png',
  'assets/images/page1/slide.png',
  'assets/images/page1/slide.png',
];

final _tabProvider = StateProvider((ref) => 0);
final _slidePosProvider = StateProvider((ref) => 0);

// ignore: must_be_immutable
class Home extends ConsumerWidget {
  Home({super.key});

  final CarouselController slideController = CarouselController();

  @override
  Widget build(BuildContext context, ref) {
    final int selectedTab = ref.watch(_tabProvider);
    final int slidePos = ref.watch(_slidePosProvider);

    final categoryData = ref.watch(getCategorys);
    final productData = ref.watch(getProducts);

    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
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
            Container(
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
            ),
            categoryData.when(
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (categoryData) {
                List<Category> categoryList = categoryData.map((e) => e).toList();

                return SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          ref.read(_tabProvider.notifier).state = index;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              categoryList[index].name ?? '',
                              style: TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 16,
                                color: selectedTab == index ? const Color(0xffFB9116) : const Color(0xff171717),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Column(
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
                          ref.read(_slidePosProvider.notifier).state = index;
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
                          color: slidePos == entry.key ? const Color(0xffFB9116) : const Color(0xffD9D9D9),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 25),
            categoryData.when(
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (categoryData) {
                List<Category> categoryList = categoryData.map((e) => e).toList();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: selectedTab == index,
                      child: Column(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: productData.when(
                              error: (err, s) => Text(err.toString()),
                              loading: () => const Center(child: CircularProgressIndicator()),
                              data: (productData) {
                                List<Product> products = productData.map((e) => e).toList();
                                List<Product> visibleWidgets = products.where((idCategory) => idCategory.category!.id == categoryList[index].id).toList();

                                return SizedBox(
                                  height: 160,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                                    itemCount: visibleWidgets.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    itemBuilder: (context, index) {
                                      String photoString = visibleWidgets[index].photo ?? "";

                                      return Container(
                                        width: 140,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffDEF4FF),
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
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      (Uri.tryParse(photoString)!.hasAbsolutePath == true) ? photoString : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                                  placeholder: (context, url) => const Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              visibleWidgets[index].name ?? "",
                                              style: const TextStyle(fontFamily: 'Oswald', fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                            ),
                                            Text(
                                              NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(visibleWidgets[index].regularPrice),
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
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
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
                            child: productData.when(
                              error: (err, s) => Text(err.toString()),
                              loading: () => const Center(child: CircularProgressIndicator()),
                              data: (productData) {
                                List<Product> products = productData.map((e) => e).toList();
                                List<Product> visibleWidgets = products.where((idCategory) => idCategory.category!.id == categoryList[index].id).toList();

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: visibleWidgets.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
                                  itemBuilder: (BuildContext context, int index) {
                                    String photoString = visibleWidgets[index].photo ?? "";

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
                                            width: 110,
                                            height: 110,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  (Uri.tryParse(photoString)!.hasAbsolutePath == true) ? photoString : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                              placeholder: (context, url) => const Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Text(
                                            visibleWidgets[index].name ?? '',
                                            style: const TextStyle(fontFamily: 'Oswald', fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                          ),
                                          Text(
                                            NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(visibleWidgets[index].regularPrice),
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
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
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
