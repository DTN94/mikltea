import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSusses extends StatelessWidget {
  const OrderSusses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFB572),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Image.asset('assets/img/img4.png'),
              Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 10),
                child: Text('Đơn hàng đã được đặt',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 76),
                child: Text('Chúc mừng bạn đã đặt thành công chúng tôi sẽ giao sớm đến cho bạn',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,),textAlign: TextAlign.center,),
              ),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                    onPressed:(){}, child:Text('Trở về',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Color (0xFFFB9116)),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
