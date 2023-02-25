import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class CartSceen extends StatelessWidget {
  const CartSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Giỏ hàng',
            style: TextStyle(fontSize: 18.0, color: Colors.black,fontWeight: FontWeight.w500)),
        actions: [
          Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(bottom: 7),
                padding: EdgeInsets.all(11),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFFE8E8E8)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(right: 20),
                      decoration:BoxDecoration(
                        color: Color(0xFFFBF4ED),
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/img/image1.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text('Sữa Tươi Trân Chân Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text('Size M',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF6C6C6C),)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,)),
                            Row(
                              children: [
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFFB9116)),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                    child: Center(child: Text('-',style: TextStyle(color: Color(0xFFFB9116)),))),
                                Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(right: 10,left: 10),
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFDDDDE3)),
                                      borderRadius:BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text('1',style: TextStyle(color: Color(0xFF6C6C6C)),))),
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFFB9116)),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                    child: Center(child: Text('+',style: TextStyle(color: Color(0xFFFB9116)),))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(bottom: 7),
                padding: EdgeInsets.all(11),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFFE8E8E8)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(right: 20),
                      decoration:BoxDecoration(
                        color: Color(0xFFFBF4ED),
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/img/image1.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text('Sữa Tươi Trân Chân Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text('Size M',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF6C6C6C),)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,)),
                            Row(
                              children: [
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFFB9116)),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                    child: Center(child: Text('-',style: TextStyle(color: Color(0xFFFB9116)),))),
                                Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(right: 10,left: 10),
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFDDDDE3)),
                                      borderRadius:BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text('1',style: TextStyle(color: Color(0xFF6C6C6C)),))),
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFFB9116)),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                    child: Center(child: Text('+',style: TextStyle(color: Color(0xFFFB9116)),))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(11),
                margin: EdgeInsets.only(bottom: 7),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFFE8E8E8)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(right: 20),
                      decoration:BoxDecoration(
                        color: Color(0xFFFBF4ED),
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/img/image1.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text('Sữa Tươi Trân Chân Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text('Size M',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF6C6C6C),)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,)),
                            Row(
                              children: [
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFFB9116)),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                    child: Center(child: Text('-',style: TextStyle(color: Color(0xFFFB9116)),))),
                                Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(right: 10,left: 10),
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFDDDDE3)),
                                      borderRadius:BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text('1',style: TextStyle(color: Color(0xFF6C6C6C)),))),
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration:BoxDecoration(
                                      border: Border.all(color: Color(0xFFFB9116)),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                    child: Center(child: Text('+',style: TextStyle(color: Color(0xFFFB9116)),))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Container(
                margin: EdgeInsets.only(bottom: 30,top: 20),
                height: 220,
                padding: EdgeInsets.only(top:26,bottom: 21,right: 30,left: 30),
                decoration: BoxDecoration(
                    color: Color(0xFFFBF4ED),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng tạm tính',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252))),
                          Text('147.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Khuyến mãi',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252))),
                          Text('0đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng cộng',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFF222222))),
                          Text('147.000đ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFF222222))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFFB9116)),

                          ),
                          onPressed:(){}, child:Text('Tiếp tục',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Colors.white),)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
