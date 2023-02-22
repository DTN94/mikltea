import 'package:flutter/material.dart';

class CartPayment extends StatefulWidget {
  const CartPayment({Key? key}) : super(key: key);

  @override
  State<CartPayment> createState() => _CartPaymentState();
}

class _CartPaymentState extends State<CartPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tóm tắt yêu cầu",
            style: TextStyle(
                fontFamily: 'Oswald',
                color: Color(0xff222222),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(),
      ),
    );
  }
}
