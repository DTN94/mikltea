import 'package:flutter/material.dart';
import '../../../models/order_models.dart';
import '../widgets/order_widgets.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();

}

class _OrderHistoryState extends State<OrderHistory> {

  @override
  Widget build(BuildContext context) {
    final itemCart = ListOrder(
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
        OrderWidget(cart:itemCart),
        OrderWidget(cart:itemCart),
        OrderWidget(cart:itemCart),
        OrderWidget(cart:itemCart),
        OrderWidget(cart:itemCart),
      ]),
    );
  }
}