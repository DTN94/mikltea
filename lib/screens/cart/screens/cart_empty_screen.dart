import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class cart_empty extends StatefulWidget {
  const cart_empty({Key? key}) : super(key: key);

  @override
  State<cart_empty> createState() => _cart_emptyState();
}

class _cart_emptyState extends State<cart_empty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đơn hàng",style: TextStyle(fontFamily: 'Oswald',color: Color(0xff222222),fontSize: 18,fontWeight: FontWeight.w500)),
      ),
      body: Column(
        mainAxisAlignment : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            child: Image.asset("assets/images/cart_emty.png"),
          ),
          Container(
            margin: EdgeInsets.only(left: 0,top: 20,right: 0,bottom: 0),
              child:
              Text("Bạn chưa có đơn đặt hàng",style: TextStyle(fontFamily: 'Oswald',color: Color(0xff222222),fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center),
          ),
          Container(
            margin: EdgeInsets.only(left: 0,top: 5,right: 0,bottom: 20),
              child: Text("Bạn nghĩ thế nào về việc thử đồ uống mới của chúng tôi ?",style: TextStyle(fontFamily: 'Oswald',color: Color(0xff222222),fontSize: 13,fontWeight: FontWeight.w300),textAlign: TextAlign.center),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffFB9116),
              minimumSize: Size(350, 42)// NEW,
            ),
            onPressed: () {},
            child: const Text(
              'Đặt Hàng Ngay',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
