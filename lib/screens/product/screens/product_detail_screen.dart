import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import '../../../models/product_model.dart';

class ProductDetail extends StatefulWidget {
  final int item;
  const ProductDetail({Key? key, required this.item}) : super(key: key);


  @override
  State<ProductDetail> createState() => _ProductDetailState();


}

class _ProductDetailState extends State<ProductDetail> with TickerProviderStateMixin {
  late TabController tabController;
  int _counter = 0;
  final int _counterStar = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _incrementCounterMinus() {
    if(_counter > _counterStar){
      setState(() {
        _counter--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var infoProduct = Product.DetailProduct(widget.item);
    String? productDetailPhoto = infoProduct?.photo;
    final List<String?> listSlide = [
      productDetailPhoto,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 50,
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GFCarousel(
              items: listSlide.map(
                    (url) {
                  return Container(
                    margin: const EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      child: Image.asset("assets/images/${url!}", fit: BoxFit.cover, width: 1000.0),
                    ),
                  );
                },
              ).toList(),
              viewportFraction: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              infoProduct!.name,
                              style: const TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff222222),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                                  .format(infoProduct!.price),
                              style: const TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xffFB9116),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.favorite,
                                size: 30, color: Color(0xFFFB9116))),
                      ]),
                  const SizedBox(height: 10),
                  GFTabBar(
                    length: 2,
                    tabBarColor: Colors.transparent,
                    controller: tabController,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: const Color(0xffFB9116),
                    indicatorPadding: const EdgeInsets.all(0),
                    labelColor: const Color(0xffFB9116),
                    tabBarHeight: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Chi tiết",
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Thành phần",
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GFTabBarView(
                      controller: tabController,
                      height: 100,
                      children: const <Widget>[
                        Text(
                          "Trong tim mỗi người luôn có một ly trà ngon, lúc rãnh rỗi sau buổi chiều, cùng với ánh hoàng hôn ấm áp, cơn gió nhẹ phảng phất dễ chịu, nụ cười ngọt ngào của người yêu, vị ngọt lưu lại trong miệng, hồi tưởng cảm xúc lần đầu nếm được mùi vị trà ngon",
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF656565),
                              height: 2),
                        ),
                        Text(
                          "Trong tim mỗi người luôn có một ly trà ngon, lúc rãnh rỗi sau buổi chiều, cùng với ánh hoàng hôn ấm áp, cơn gió nhẹ phảng phất dễ chịu, nụ cười ngọt ngào của người yêu, vị ngọt lưu lại trong miệng, hồi tưởng cảm xúc lần đầu nếm được mùi vị trà ngon",
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF656565),
                              height: 2),
                        ),
                      ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Size: ',
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: 14,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w400),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: const Color(0xffFB9116),
                          elevation: 0,
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4.0, right: 8.0, left: 8.0),
                          minimumSize: const Size(25, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {},
                        child: Text(
                          infoProduct!.size,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color(0xffFB9116)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shadowColor: Colors.white,
                          minimumSize: const Size(40, 40),
                          side: const BorderSide(color: Color(0xffFB9116), width: 1.0, style: BorderStyle.solid),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          alignment: Alignment.center,
                        ),
                        onPressed: _incrementCounterMinus,
                        child: const Text(
                          '-',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Color(0xffFB9116)),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                            hintText: '$_counter',
                            contentPadding: const EdgeInsets.only(top: 5),
                          ),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shadowColor: Colors.white,
                          minimumSize: const Size(40, 40),
                          side: const BorderSide(color: Color(0xffFB9116), width: 1.0, style: BorderStyle.solid),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          alignment: Alignment.center,
                        ),
                        onPressed: _incrementCounter,
                        child: const Text(
                          '+',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Color(0xffFB9116)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffFAF2EA),
                          shadowColor: Colors.white,
                          minimumSize: const Size(185, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Mua Ngay',
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFB9116)),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffFB9116),
                          shadowColor: Colors.white,
                          minimumSize: const Size(185, 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Thêm Vào Giỏ Hàng',
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
