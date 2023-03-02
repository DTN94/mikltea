import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../controllers/cart.dart';

class CartScreen extends ConsumerWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var cartItems = CartProvider().cartItems;
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 450,
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(width: 1, color: const Color(0xffE8E8E8), style: BorderStyle.solid)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: 120,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                    placeholder: (context, url) => Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: const [CircularProgressIndicator()],
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Test',
                                    style: const TextStyle(fontFamily: 'Oswald', fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(30),
                                          style: const TextStyle(
                                            fontFamily: 'Oswald',
                                            fontSize: 15,
                                            color: Color(0xff222222),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  side: const BorderSide(color: Color(0xffFB9116)),
                                                  backgroundColor: Colors.white,
                                                  padding: EdgeInsets.zero,
                                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                ),
                                                child: const FaIcon(
                                                  FontAwesomeIcons.minus,
                                                  color: Color(0xffFB9116),
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 35,
                                              width: 35,
                                              margin: const EdgeInsets.only(left: 10, right: 10),
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: Colors.white, border: Border.all(width: 2, color: const Color(0xffDDDDE3))),
                                              child: Center(
                                                child: Text(
                                                  '1',
                                                  style: const TextStyle(color: Colors.black, fontSize: 15),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  side: const BorderSide(color: Color(0xffFB9116)),
                                                  backgroundColor: Colors.white,
                                                  padding: EdgeInsets.zero,
                                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                ),
                                                child: const FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  color: Color(0xffFB9116),
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(color: Color(0xffFBF4ED), borderRadius: BorderRadius.circular(20)),
                height: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng tạm tính',
                          style: TextStyle(fontFamily: 'Oswald', color: Color(0xff525252), fontWeight: FontWeight.w300, fontSize: 15),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(10),
                          style: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222), fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Khuyến mãi',
                          style: TextStyle(fontFamily: 'Oswald', color: Color(0xff525252), fontWeight: FontWeight.w300, fontSize: 15),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(0),
                          style: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222), fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng cộng',
                          style: TextStyle(fontFamily: 'Oswald', color: Color(0xff525252), fontSize: 15),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(10),
                          style: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: const Color(0xffFB9116),
                        ),
                        child: const Center(child: Text('Tiếp Tục', style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Colors.white))),
                      ),
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

  AppBar appBar(context) {
    return AppBar(
      title: const Text('Giỏ hàng'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/Arrow - Left.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 80,
            height: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xffF2F2F2), borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/dots.svg',
                  width: 10,
                  height: 4,
                ),
                const VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 1,
                ),
                SvgPicture.asset(
                  'assets/images/round-x.svg',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
