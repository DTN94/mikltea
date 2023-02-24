import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/constants/api_product_constant.dart';
import 'package:mikltea/screens/cart/screens/cart_payment_screen.dart';
import '../../../models/api_product_model.dart';
import '../../../models/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<ApiProduct>> listCart = ApiConstants.getListCart();
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Giỏ hàng",
              style: TextStyle(
                  fontFamily: 'Oswald',
                  color: Color(0xff222222),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<List<ApiProduct>>(
                  future: listCart,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: () {},
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: const Color(0xffE8E8E8)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            snapshot.data![index].images![0]
                                                .toString(),
                                            fit: BoxFit.cover,
                                            width: 110,
                                            height: 110,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 15,
                                              top: 0,
                                              right: 0,
                                              bottom: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                snapshot.data![index].title
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontFamily: 'Oswald',
                                                    color: Color(0xff222222),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                "Size: M",
                                                style: TextStyle(
                                                    fontFamily: 'Oswald',
                                                    color: Color(0xff6C6C6C),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    170,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      NumberFormat
                                                              .simpleCurrency(
                                                                  locale:
                                                                      'vi-VN',
                                                                  decimalDigits:
                                                                      0)
                                                          .format(snapshot
                                                              .data![index]
                                                              .price),
                                                      style: const TextStyle(
                                                          fontFamily: 'Oswald',
                                                          color:
                                                              Color(0xff222222),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.white,
                                                            shadowColor:
                                                                Colors.white,
                                                            minimumSize:
                                                                const Size(
                                                                    24, 24),
                                                            side: const BorderSide(
                                                                color: Color(
                                                                    0xffFB9116),
                                                                width: 1.0,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0)),
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                          ),
                                                          onPressed: () {},
                                                          child: const Text(
                                                            '-',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Color(
                                                                    0xffFB9116)),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 24,
                                                          height: 24,
                                                          child: TextField(
                                                            textAlign: TextAlign
                                                                .center,
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .center,
                                                            decoration:
                                                                InputDecoration(
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              hintText:
                                                                  '$_counter',
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5),
                                                            ),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.white,
                                                            shadowColor:
                                                                Colors.white,
                                                            minimumSize:
                                                                const Size(
                                                                    24, 24),
                                                            side: const BorderSide(
                                                                color: Color(
                                                                    0xffFB9116),
                                                                width: 1.0,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0)),
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                          ),
                                                          onPressed: () {},
                                                          child: const Text(
                                                            '+',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Color(
                                                                    0xffFB9116)),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.cyanAccent),
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 35, left: 0, bottom: 0, right: 0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xffFBF4ED),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Tổng tạm tính",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Color(0xff525252),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "147.000đ",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Color(0xff525252),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Khuyến mãi",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Color(0xff525252),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "0đ",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Color(0xff525252),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Tổng cộng",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Color(0xff222222),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "147.000đ",
                            style: TextStyle(
                                fontFamily: 'Oswald',
                                color: Color(0xff222222),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffFB9116),
                            minimumSize: const Size(180, 50) // NEW,
                            ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPayment()));
                        },
                        child: const Text(
                          'Tiếp Tục',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
