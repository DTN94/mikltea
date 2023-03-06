import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:milktea/provider/product_controller.dart';

import '../model/cart_model.dart';
import '../repository/cart_repository.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends ConsumerWidget {
  ProductDetailScreen({super.key, required this.productId});

  final int productId;

  List<String> btnDetail = ['Chi tiết', 'Thành phần'];
  final _tabProvider = StateProvider((ref) => 0);
  final _sizeProvider = StateProvider((ref) => 0);
  final _size = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedTab = ref.watch(_tabProvider);
    final int selectedSize = ref.watch(_sizeProvider);
    final int size = ref.watch(_size);

    final product = ref.watch(getProductProvider(productId));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icon/arrow_left.svg', width: 20, height: 20),
          ),
        ),
      ),
      body: product.when(
        error: (err, s) => Text('Erros: $err'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (product) {
          var detailGallery = product.gallery.isEmpty ? [product.photo] : product.gallery;

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
                            product.name,
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
                                  SvgPicture.asset('assets/icon/heart.svg', width: 30, height: 30),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(product.regularPrice),
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
                              index == 0 ? (product.desc) : (product.content),
                              style: const TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff656565), height: 2),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      if (product.sizes.isNotEmpty)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Size:',
                              style: TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222)),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: product.sizes.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      ref.read(_sizeProvider.notifier).state = index;
                                    },
                                    child: Container(
                                      //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      color: index == selectedSize ? const Color(0xffFB9116) : Colors.white,
                                      child: Center(
                                        child: Text(
                                          product.sizes[index].name,
                                          style: TextStyle(
                                            color: index == selectedSize ? Colors.white : const Color(0xff222222),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (size > 0) {
                                ref.read(_size.notifier).state--;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              side: const BorderSide(color: Color(0xffFB9116)),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: const Size(40, 40),
                            ),
                            child: SvgPicture.asset('assets/icon/minus.svg', width: 14, height: 2),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.white, border: Border.all(color: const Color(0xffDDDDE3))),
                            child: Text(
                              size.toString(),
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ref.read(_size.notifier).state++;
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              side: const BorderSide(color: Color(0xffFB9116)),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize: const Size(40, 40),
                            ),
                            child: SvgPicture.asset('assets/icon/plus.svg', width: 14, height: 14),
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
                                ref.read(cartProvider.notifier).addToCart(
                                      CartModel(
                                        id: product.id,
                                        productId: product.id,
                                        productName: product.name,
                                        productPhoto: product.photo,
                                        quantity: size,
                                        price: product.regularPrice,
                                      ),
                                    );
                                context.go(context.namedLocation('cart'));
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
