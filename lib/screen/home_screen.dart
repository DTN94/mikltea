import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:milktea/provider/category_controller.dart';
import 'package:milktea/provider/product_controller.dart';
import 'package:milktea/provider/slide_controller.dart';
import 'package:milktea/screen/widget/appbar_user_widget.dart';
import 'package:milktea/screen/widget/product_card_widget.dart';

final List<String> slides = ['https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'];

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final _slidePosProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(allCategoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final products = ref.watch(allProductsProvider);
    final slides = ref.watch(allSlidesProvider);

    final slidePos = ref.watch(_slidePosProvider);

    return Scaffold(
      appBar: const AppBarUser(avatar: 'https://ui-avatars.com/api/?name=John+Doe', username: 'Huu Tho !'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Thưởng thức trà sữa ngon',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff252525)),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
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
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm',
                    hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff7A7D8A), fontWeight: FontWeight.w300),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(13),
                      child: SvgPicture.asset('assets/icon/search.svg'),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            categories.when(
              error: (err, s) => Text('Errors: $err'),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (categories) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            ref.read(selectedCategoryProvider.notifier).setSelectedCategory(categories[index]);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 50),
                            child: Center(
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 16,
                                  color: selectedCategory == categories[index] ? const Color(0xffFB9116) : const Color(0xff171717),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            slides.when(
              error: (err, s) => Text('Errors: $err'),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (slides) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        child: CarouselSlider(
                          items: slides
                              .map(
                                (url) => ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.hardEdge,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 150,
                                    child: CachedNetworkImage(
                                      imageUrl: (Uri.tryParse(url)!.hasAbsolutePath == true) ? url : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
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
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Phổ Biến Nhất', style: TextStyle(fontFamily: 'Oswald', fontSize: 17, fontWeight: FontWeight.w500)),
                  GestureDetector(
                    child: const Center(
                      child: Text('Xem tất cả', style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xffFB9116))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            products.when(
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (products) {
                return SizedBox(
                  height: 160,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index], cardWidth: 140, cardHeight: 160);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Best Seller', style: TextStyle(fontFamily: 'Oswald', fontSize: 17, fontWeight: FontWeight.w500)),
                  GestureDetector(
                    child: const Center(
                      child: Text('Xem tất cả', style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xffFB9116))),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            products.when(
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (products) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(product: products[index], cardWidth: 170, cardHeight: 210);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
