import 'package:flutter/material.dart';
import 'package:mikltea/screens/cart/models/cart_models.dart';
import 'package:mikltea/screens/cart/screens/cart_screen.dart';

class CartWidget extends StatelessWidget {
  final Cart cart;
  const CartWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(cart.trangthai),
          )
        ],
      ),
    );
  }
}

