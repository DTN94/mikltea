// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mikltea/screens/cart/models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> iproduct = [
    Product(
        id: 1,
        name: "Trà Xoài Kem Cheese",
        photo: "item1.png",
        size: "M",
        price: 49000,
        quantity: 1),
    Product(
        id: 2,
        name: "Trà Trái Cây Nhiệt Đới",
        photo: "item2.png",
        size: "M",
        price: 45000,
        quantity: 1),
    Product(
        id: 3,
        name: "Tươi Trân Chân Đường Đen",
        photo: "item3.png",
        size: "L",
        price: 42000,
        quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: Image.asset("assets/images/icon_cart.png",
                  fit: BoxFit.contain)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                        getColor(Colors.white, Color(0xff171717)),
                        backgroundColor:
                        getColor(Color(0xffFB9116), Colors.white),
                        side: getBorder(Color(0xffFB9116), Color(0xff171717))),
                    onPressed: () {},
                    child: const Text(
                      'Trà Sữa',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                        getColor(Color(0xff171717), Colors.white),
                        backgroundColor:
                        getColor(Colors.white, Color(0xffFB9116)),
                        side: getBorder(Color(0xff171717), Color(0xffFB9116))),
                    onPressed: () {},
                    child: const Text(
                      'Trà Trái Cây',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                        getColor(Color(0xff171717), Colors.white),
                        backgroundColor:
                        getColor(Colors.white, Color(0xffFB9116)),
                        side: getBorder(Color(0xff171717), Color(0xffFB9116))),
                    onPressed: () {},
                    child: const Text(
                      'Nước Ép',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GridProduct(item: iproduct),
          ],
        ),
      ),
    );
  }
}

class GridProduct extends StatelessWidget {

  final List<Product> item;

  const GridProduct({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: item.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15)),
            child: Text(item[index].name),
          );
        }
    );
  }
}

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  getColor(Set<MaterialState> state) {
    if (state.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  }
  return MaterialStateProperty.resolveWith((getColor));
}

MaterialStateProperty<BorderSide> getBorder(Color color, Color colorPressed) {
  getBorder(Set<MaterialState> state) {
    if (state.contains(MaterialState.pressed)) {
      return BorderSide(color: colorPressed, width: 1);
    } else {
      return BorderSide(color: color, width: 1);
    }
  }
  return MaterialStateProperty.resolveWith((getBorder));
}
