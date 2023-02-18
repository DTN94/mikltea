import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/screens/cart/models/cart_models.dart';
import 'package:mikltea/screens/cart/screens/cart_screen.dart';

class CartWidget extends StatelessWidget {
  final Cart cart;

  const CartWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( left: 0, top: 5, right: 0, bottom: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 90,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffFFF5EB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  cart.trangthai,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Oswald',
                      color: Color(0xffFB9116),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              Text("${cart.ngay}, ${cart.gio}",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontFamily: 'Oswald',
                      color: Color(0xff808089),
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                child: Image.asset("assets/images/icon_home.png", width: 24),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 0, right: 0, bottom: 0),
                child: Text(
                  cart.diachicuahang,
                  style: const TextStyle(
                      fontFamily: 'Oswald',
                      color: Color(0xff222222),
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5,
                    color: const Color(0xffEBEBF0),
                    strokeAlign: BorderSide.strokeAlignCenter)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                child: Image.asset("assets/images/icon_map.png",
                    width: 24, fit: BoxFit.contain),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 0, right: 0, bottom: 0),
                child: Text(
                  cart.diachinhan,
                  style: const TextStyle(
                      fontFamily: 'Oswald',
                      color: Color(0xff222222),
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  cart.sanpham,
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Oswald',
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w300),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                    NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                        .format(cart.price),
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Oswald',
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
