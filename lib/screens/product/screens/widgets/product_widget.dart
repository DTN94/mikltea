import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/screens/product/model/product_model.dart';
import 'package:mikltea/screens/product/screens/detail_screens.dart';
import 'package:animations/animations.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key? key,required this.item}) : super(key: key);
  final ProductModel item ;

  @override
  Widget build(BuildContext context) {
    final transitionType = ContainerTransitionType.fade;
    return SizedBox(
      width: 160,
      child: OpenContainer(
        transitionType: transitionType,
        transitionDuration: Duration(seconds: 1),
        openBuilder: (context, _) => DetailProduct(id: num.parse(item.id.toString())),
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Card(
              elevation: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Color(0xFFEFE3FF),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network((item.images![0]).toString(),fit: BoxFit.fitWidth,height: 125,)
                      ),
                      SizedBox(height: 10),
                      Text(item.title.toString(),style: TextStyle(fontSize: 14,color: Colors.black),overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5),
                      Text(NumberFormat("#,###", "en_US").format((item.price)) +" đ",
                          style: TextStyle(fontSize: 13,color: Color(0xFFFB9116))
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
