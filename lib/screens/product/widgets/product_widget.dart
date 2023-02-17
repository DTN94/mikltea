import 'package:flutter/material.dart';

class ItemProduct extends StatefulWidget {
  const ItemProduct({Key? key}) : super(key: key);

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
      child: Card(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color(0xFFEFE3FF),
            child: Column(
              children: [
                Image.asset('assets/images/product1.png',fit: BoxFit.fitWidth,),
                SizedBox(height: 10),
                Text('Trân Châu Đường Đen',style: TextStyle(fontSize: 13,color: Colors.black),),
                SizedBox(height: 5),
                Text('49.000đ',style: TextStyle(fontSize: 13,color: Color(0xFFFB9116)),),
              ],
            ),
          ),
        )
      ),
    );
  }
}
