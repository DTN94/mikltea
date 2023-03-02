import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/models/product.dart';
import 'package:mikltea/screens/menu/menu_detail_screen.dart';

import '../../controllers/category.dart';
import '../../controllers/product.dart';
import '../../models/category.dart';

final _tabProvider = StateProvider((ref) => 0);

class Menu extends ConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedTab = ref.watch(_tabProvider);
    final categoryData = ref.watch(getCategorys);
    final productData = ref.watch(getProducts);

    return Scaffold(
      appBar: appBar(context),
      body: categoryData.when(
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (categoryData) {
          List<Category> categoryList = categoryData.map((e) => e).toList();

          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ref.read(_tabProvider.notifier).state = index;
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: selectedTab == index ? const Color(0xffFB9116) : const Color(0xff757575), width: 1),
                            borderRadius: BorderRadius.circular(50),
                            color: selectedTab == index ? const Color(0xffFB9116) : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              categoryList[index].name ?? "",
                              style: TextStyle(
                                fontFamily: 'Oswald',
                                fontSize: 16,
                                color: selectedTab == index ? Colors.white : const Color(0xff171717),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Visibility(
                        visible: selectedTab == index,
                        child: productData.when(
                            error: (err, s) => Text(err.toString()),
                            loading: () => const Center(child: CircularProgressIndicator()),
                            data: (productData) {
                              List<Product> products = productData.map((e) => e).toList();
                              List<Product> visibleWidgets = products.where((idCategory) => idCategory.category!.id == categoryList[index].id).toList();

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 15),
                                  SizedBox(
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
                                      itemCount: (visibleWidgets.isNotEmpty) ? visibleWidgets.length : 0,
                                      itemBuilder: (BuildContext context, int index) {
                                        String photoString = visibleWidgets[index].photo ?? "";

                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (BuildContext context) => MenuDetail(id: visibleWidgets[index].id),
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
                                                    imageUrl: (Uri.tryParse(photoString)!.hasAbsolutePath == true)
                                                        ? photoString
                                                        : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
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
                                          ),
                                        );
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
                            }),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
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

/* class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Material(
        child: FutureBuilder<List<ProductList>>(
          future: _categoryList,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (!snapshot.hasData) return const CircularProgressIndicator();

            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: selectedTab == index ? const Color(0xffFB9116) : const Color(0xff757575), width: 1),
                              borderRadius: BorderRadius.circular(50),
                              color: selectedTab == index ? const Color(0xffFB9116) : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data![index].name,
                                style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 16,
                                  color: selectedTab == index ? Colors.white : const Color(0xff171717),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Visibility(
                          visible: selectedTab == index,
                          child: MenuView(id_list: snapshot.data![index].id),
                        );
                      },
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
    return SingleChildScrollView(
      child: FutureBuilder<List<Product>>(
        future: _productList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Product> visibleWidgets = snapshot.data!.where((idCategory) => idCategory.productList.id == id_list).toList();
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
                imageUrl: (Uri.tryParse(product.photo)!.hasAbsolutePath == true) ? product.photo : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
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
              product.name,
              style: const TextStyle(fontFamily: 'Oswald', fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff222222)),
            ),
            Text(
              NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(product.regularPrice),
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
 */