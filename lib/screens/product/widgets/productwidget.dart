import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final int index;
  final VoidCallback onClicked;
  final List<Product> item;

  const ProductWidget({Key? key, required this.index, required this.onClicked, required this.item})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          color: const Color(0xfff8f8f8),
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: Image.asset(
                  "assets/images/${item[index].photo}",
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(item[index].name,
                  style: const TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff222222)),
                ),
              ),
              Text(
                NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                    .format(item[index].price),
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Oswald',
                    color: Color(0xffFB9116),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}
