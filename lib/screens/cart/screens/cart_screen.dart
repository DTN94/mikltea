import 'package:flutter/material.dart';
import 'package:mikltea/screens/cart/screens/cart_empty_screen.dart';
import 'package:mikltea/screens/cart/screens/cart_history_screen.dart';
import 'package:mikltea/screens/cart/widgets/cart_widgets.dart';

import '../models/cart_models.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    final itemCart = Cart("");
    if (itemCart.trangthai.isEmpty) {
      return cart_empty();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Đơn hàng",
              style: TextStyle(
                  fontFamily: 'Oswald',
                  color: Color(0xff222222),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartHistory()));
              },
              child: const Text('Lịch sử đặt hàng',
                  style: TextStyle(
                      fontFamily: 'Oswald',
                      color: Color(0xff808089),
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
            ),
          ],
        ),
        backgroundColor: const Color(0xffF5F5FA),
        body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
          CartWidget(cart: itemCart),
        ]),
      );
    }
  }
}
