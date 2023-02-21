import 'package:flutter/material.dart';
import 'package:mikltea/models/order_models.dart';
import 'package:mikltea/screens/order/screens/order_history_screen.dart';
import 'package:mikltea/screens/order/widgets/order_widgets.dart';

import 'order_empty_screen.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    final itemCart = ListOrder("");
    if (itemCart.trangthai.isEmpty) {
      return OrderEmpty();
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
                    MaterialPageRoute(builder: (context) => OrderHistory()));
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
          OrderWidget(cart: itemCart),
        ]),
      );
    }
  }
}