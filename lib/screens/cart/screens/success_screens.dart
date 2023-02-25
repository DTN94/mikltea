import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../product/screens/home_screens.dart';


class OrderSuccess extends StatefulWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEFB572),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,          
            children: [
              Image.asset('assets/images/success.png'),
              SizedBox(height: 50),
              Text('Đơn hàng đã được đặt',style: TextStyle(fontSize: 21,color: Color(0xFF222222),fontWeight: FontWeight.w500),),
              SizedBox(height: 5),
              Text('Chúc mừng bạn đã đặt thành công chúng tôi sẽ giao sớm đến cho bạn',style: TextStyle(fontSize: 14,color: Color(0xFF222222)),),
              SizedBox(height: 70),
              GFButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageProduct()));
                },
                text: "Trở Về",
                color: Color(0xFFFFFFFF),
                padding: EdgeInsets.only(left: 50,right: 50),
                shape: GFButtonShape.pills,
                size: GFSize.LARGE,
                textStyle: TextStyle(fontSize: 16,color: Color(0xFFFB9116),fontFamily: 'Oswald-Medium'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
