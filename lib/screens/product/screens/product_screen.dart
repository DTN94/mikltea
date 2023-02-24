import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';
import 'package:mikltea/constants/api_product_constant.dart';
import 'package:mikltea/screens/cart/screens/cart_screen.dart';
import 'package:mikltea/screens/product/screens/product_detail_screen.dart';
import '../../../models/api_product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  late Future<List<ApiProduct>> listProduct;
  late Future<List<Category>> listCatagory;

  int indexTab = 0;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 1, vsync: this, initialIndex: indexTab);

    listProduct = ApiConstants.getProduct();
    listCatagory = ApiConstants.getCategory();
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
        child: FutureBuilder<List<Category>>(
          future: listCatagory,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              tabController = TabController(
                  vsync: this,
                  length: snapshot.data!.length,
                  initialIndex: indexTab);
              tabController.addListener(_handleTabController);
              return Column(
                children: [
                  TabBar(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    controller: tabController,
                    indicatorColor: Colors.transparent,
                    labelPadding: const EdgeInsets.only(
                        top: 0, left: 0, right: 5, bottom: 0),
                    tabs: snapshot.data!.map((e) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          border: indexTab == snapshot.data!.indexOf(e)
                              ? Border.all(color: Colors.white, width: 0)
                              : Border.all(
                                  color: const Color(0xff757575), width: 1),
                          borderRadius: BorderRadius.circular(50),
                          color: indexTab == snapshot.data!.indexOf(e)
                              ? const Color(0xffFB9116)
                              : Colors.white,
                        ),
                        child: Text(
                          e.name.toString(),
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 16,
                            color: indexTab == snapshot.data!.indexOf(e)
                                ? Colors.white
                                : const Color(0xff171717),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: snapshot.data!.map((var e) {
                        return GridProductView(
                            id_list: int.parse(e.id.toString()));
                      }).toList(),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const Center(
              child:
                  CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
            );
          },
        ),
      ),
    );
  }
}

class GridProductView extends StatefulWidget {
  const GridProductView({Key? key, required this.id_list}) : super(key: key);
  final int id_list;

  @override
  State<GridProductView> createState() => _GridProductViewState();
}

class _GridProductViewState extends State<GridProductView> {
  late final Future<List<ApiProduct>> _productList =
      ApiConstants.getCategoryById(widget.id_list);

  var transitionType = ContainerTransitionType.fadeThrough;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ApiProduct>>(
      future: _productList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) => OpenContainer(
              closedColor: Colors.white,
              closedElevation: 0,
              transitionType: transitionType,
              transitionDuration: const Duration(milliseconds: 490),
              openBuilder: (context, _) => ProductDetail(
                  item: int.parse(snapshot.data![index].id.toString())),
              closedBuilder: (context, action) {
                return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Card(
                      color: const Color(0xfff8f8f8),
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.network(
                              snapshot.data![index].images![0].toString(),
                              fit: BoxFit.cover,
                              width: 200,
                              height: 150,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              snapshot.data![index].title.toString(),
                              style: const TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff222222)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            NumberFormat.simpleCurrency(
                                    locale: 'vi-VN', decimalDigits: 0)
                                .format(snapshot.data![index].price),
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Oswald',
                                color: Color(0xffFB9116),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
        );
      },
    );
  }
}
