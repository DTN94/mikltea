import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../controllers/product.dart';
import '../../models/product.dart';

class MenuDetail extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int id;
  // ignore: non_constant_identifier_names
  const MenuDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> with TickerProviderStateMixin {
  late TabController tabController;

  late Future<List<Product>> _productList;

  late TabController _tabController = TabController(vsync: this, length: 0);
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {});
      }
    });

    _productList = productDetail(widget.id);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int? _selectedSize;
  List<String> btnSizes = ['M', 'L'];

  Widget btnSize({required String text, required int index}) {
    return InkWell(
      splashColor: const Color(0xffFB9116),
      onTap: () {
        setState(() {
          _selectedSize = index;
        });
      },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Product>>(
          future: _productList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  slideDetail(snapshot.data![0].images),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data![0].title,
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
                            NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(snapshot.data![0].price),
                            style: const TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 25,
                              color: Color(0xffFB9116),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.maxFinite,
                          child: TabBar(
                            isScrollable: false,
                            dividerColor: const Color(0xffEFEFEF),
                            controller: tabController,
                            indicatorColor: const Color(0xffFB9116),
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelColor: const Color(0xffFB9116),
                            unselectedLabelColor: const Color(0xff656565),
                            labelStyle: const TextStyle(fontFamily: 'Oswald', color: Color(0xffFB9116), fontSize: 16),
                            unselectedLabelStyle: const TextStyle(fontFamily: 'Oswald', color: Color(0xff656565), fontSize: 16),
                            // ignore: prefer_const_literals_to_create_immutables
                            tabs: [
                              const Tab(
                                child: Text('Chi tiết'),
                              ),
                              const Tab(
                                child: Text('Thành phần'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          width: double.maxFinite,
                          height: 200,
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              Text(
                                snapshot.data![0].description,
                                style: const TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff656565), height: 2),
                              ),
                              const Text(
                                'Trong tim mỗi người luôn có một ly trà ngon, lúc rãnh rỗi sau buổi chiều, cùng với ánh hoàng hôn ấm áp, cơn gió nhẹ phảng phất dễ chịu, nụ cười ngọt ngào của người yêu',
                                style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff656565), height: 2),
                              ),
                            ],
                          ),
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
                                  backgroundColor: const Color(0xffFAF2EA),
                                ),
                                child: const Text('Mua Ngay', style: TextStyle(fontFamily: 'Oswald', fontSize: 14, color: Color(0xffFB9116))),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
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
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  SizedBox slideDetail(List<String?> slides) {
    return SizedBox(
      width: double.maxFinite,
      child: CarouselSlider(
        items: slides
            .map(
              (pic) => CachedNetworkImage(
                imageUrl: (Uri.tryParse(pic!)!.hasAbsolutePath == true) ? pic : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                placeholder: (context, url) => Column(
                  children: [CircularProgressIndicator()],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  AppBar appBar() {
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
