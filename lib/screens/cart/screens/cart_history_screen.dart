import 'package:flutter/material.dart';
import '../models/cart_models.dart';
import 'package:mikltea/screens/cart/widgets/cart_widgets.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  State<CartHistory> createState() => _CartHistoryState();

}

class _CartHistoryState extends State<CartHistory> {

  @override
  Widget build(BuildContext context) {
    final itemCart = Cart(
        "101",
        "Đã giao hàng",
        "30/11/2022",
        "4:20",
        "CVPM Quang Trung,P. Tân Chánh Hiệp, Quận 12",
        "Đường Điện Biên Phủ, Phường 22, Quận Bình Thạnh, HCM",
        "Sữa tươi trân châu đường đen (x1), Trà Xoài Kem Cheese (x1), Trà trái cây nhiệt đới (x1)",
        147000);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch sử đơn hàng",
            style: TextStyle(
                fontFamily: 'Oswald',
                color: Color(0xff222222),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: const Color(0xffF5F5FA),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        CartWidget(cart:itemCart),
        CartWidget(cart:itemCart),
        CartWidget(cart:itemCart),
        CartWidget(cart:itemCart),
        CartWidget(cart:itemCart),
      ]),
    );
  }
}