import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';
import 'package:mikltea/constants/api_constant.dart';
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
  int indexTab = 0;
  var transitionType = ContainerTransitionType.fade;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabController);
    listProduct = ApiConstants.getProduct();
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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                isScrollable: true,
                dividerColor: Colors.transparent,
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelPadding:
                    const EdgeInsets.only(top: 0, left: 0, right: 5, bottom: 0),
                tabs: [
                  Tab(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: indexTab == 0
                          ? Border.all(color: Colors.white)
                          : Border.all(
                              color: const Color(0xff757575), width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: indexTab == 0
                          ? const Color(0xffFB9116)
                          : Colors.white,
                    ),
                    child: Text(
                      'Trà Sữa',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                          color: indexTab == 0
                              ? Colors.white
                              : const Color(0xff222222)),
                    ),
                  )),
                  Tab(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: indexTab == 1
                          ? Border.all(color: Colors.white)
                          : Border.all(
                              color: const Color(0xff757575), width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: indexTab == 1
                          ? const Color(0xffFB9116)
                          : Colors.white,
                    ),
                    child: Text(
                      'Trà Giải Nhiệt',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                          color: indexTab == 1
                              ? Colors.white
                              : const Color(0xff222222)),
                    ),
                  )),
                  Tab(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: indexTab == 2
                          ? Border.all(color: Colors.white)
                          : Border.all(
                              color: const Color(0xff757575), width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: indexTab == 2
                          ? const Color(0xffFB9116)
                          : Colors.white,
                    ),
                    child: Text(
                      'Các Loại Khác',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w400,
                          color: indexTab == 2
                              ? Colors.white
                              : const Color(0xff222222)),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    FutureBuilder<List<ApiProduct>>(
                      future: listProduct,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio:0.8,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => OpenContainer(
                              closedColor: Colors.white,
                              closedElevation: 0,
                              transitionType: transitionType,
                              transitionDuration: const Duration(seconds: 1),
                              openBuilder: (context, _) => ProductDetail(item: snapshot.data?[index].id),
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
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                            snapshot.data![index].images![0].toString(),fit: BoxFit.cover,
                                          width: 200,
                                          height: 150,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10,bottom: 5),
                                        child: Text(snapshot.data![index].title.toString(),
                                          style: const TextStyle(
                                              fontFamily: 'Oswald',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff222222)),maxLines: 1,overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                                            .format(snapshot.data![index].price),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Oswald',
                                            color: Color(0xffFB9116),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                )
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(child: Text('Error'),);
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.cyanAccent),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


