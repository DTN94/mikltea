import 'package:flutter/material.dart';
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

    final itemCart=Cart(
        "Đang chuẩn bị",
        "30/11/2022",
        "4:20",
        "CVPM Quang Trung,P. Tân Chánh Hiệp, Quận 12",
        "Đường Điện Biên Phủ, Phường 22, Quận Bình Thạnh, HCM",
        "Sữa tươi trân châu đường đen (x1), Trà Xoài Kem Cheese (x1), Trà trái cây nhiệt đới (x1)",
        147.000);

    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn hàng",
            style: TextStyle(
                fontFamily: 'Oswald',
                color: Color(0xff222222),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text('Lịch sử đặt hàng',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    color: Color(0xff808089),
                    fontSize: 13,
                    fontWeight: FontWeight.w300)),
          ),
        ],
      ),
      backgroundColor: Color(0xffF5F5FA),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        CartWidget(cart:itemCart,),
      ]),
    );
  }
}
