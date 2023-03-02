import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../controllers/cart.dart';
import '../../controllers/product.dart';
import '../../models/cart.dart';
import '../../models/product.dart';
import '../cart/cart_screen.dart';

final _tabProvider = StateProvider((ref) => 0);

// ignore: must_be_immutable
class MenuDetail extends ConsumerWidget {
  final int id;
  MenuDetail({Key? key, required this.id}) : super(key: key);

  int? _selectedSize;
  List<String> btnSizes = ['M', 'L'];
  List<String> btnDetail = ['Chi tiết', 'Thành phần'];

  @override
  Widget build(BuildContext context, ref) {
    final int selectedTab = ref.watch(_tabProvider);
    final productData = ref.watch(productDetail(id));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      body: productData.when(
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (productData) {
          List<Product> products = productData.map((e) => e).toList();
          var detailGallery = products[0].gallery.isEmpty ? [products[0].photo] : products[0].gallery;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 390,
                  child: CarouselSlider(
                    items: detailGallery
                        .map(
                          (pic) => CachedNetworkImage(
                            imageUrl: (Uri.tryParse(pic)!.hasAbsolutePath == true) ? pic : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                            placeholder: (context, url) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [CircularProgressIndicator()],
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            fit: BoxFit.fill,
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: 390,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      viewportFraction: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            products[0].name,
                            style: const TextStyle(fontFamily: 'Oswald', fontSize: 20, color: Color(0xff282828)),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: 45,
                              height: 45,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/heart2.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(products[0].regularPrice),
                          style: const TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 25,
                            color: Color(0xffFB9116),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: btnDetail.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: GestureDetector(
                                onTap: () {
                                  ref.read(_tabProvider.notifier).state = index;
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: selectedTab == index ? const Color(0xffFB9116) : const Color(0xffEFEFEF), width: 1)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      btnDetail[index],
                                      style: TextStyle(
                                        fontFamily: 'Oswald',
                                        fontSize: 16,
                                        color: selectedTab == index ? const Color(0xffFB9116) : const Color(0xff656565),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Visibility(
                            visible: selectedTab == index,
                            child: Text(
                              index == 0 ? (products[0].desc) : (products[0].content),
                              style: const TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff656565), height: 2),
                            ),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Size:',
                            style: TextStyle(fontFamily: 'Oswald', fontSize: 14, color: Color(0xff222222)),
                          ),
                          const SizedBox(width: 20),
                          ...List.generate(
                            btnSizes.length,
                            (index) => btnSize(
                              index: index,
                              text: btnSizes[index],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              side: const BorderSide(color: Color(0xffFB9116)),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: const Size(40, 40),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.minus,
                              color: Color(0xffFB9116),
                              size: 17,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.white, border: Border.all(color: const Color(0xffDDDDE3))),
                            child: const Text(
                              '3',
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              side: const BorderSide(color: Color(0xffFB9116)),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: const Size(40, 40),
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.plus,
                              color: Color(0xffFB9116),
                              size: 17,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 170,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: const Text('Mua Ngay', style: TextStyle(fontFamily: 'Oswald', fontSize: 14, color: Color(0xffFB9116))),
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                CartProvider().addCart(Cart(id: products[0].id, product: products[0], quantity: 1, price: products[0].regularPrice));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => CartScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: const Color(0xffFB9116),
                              ),
                              child: const Text('Thêm Vào Giỏ Hàng', style: TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget btnSize({required String text, required int index}) {
    return InkWell(
      splashColor: const Color(0xffFB9116),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        //color: index == _selectedSize ? Colors.blue : Colors.white,
        child: Text(
          text,
          style: TextStyle(
            color: index == _selectedSize ? const Color(0xffFB9116) : const Color(0xff222222),
          ),
        ),
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/Arrow - Left.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
