import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Request extends StatelessWidget {
  const Request({Key? key}) : super(key: key);

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
        title: const Text('Tóm tắt yêu cầu',
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                margin: EdgeInsets.only(bottom: 20,top: 40),
                padding: EdgeInsets.all(13),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  border: Border.all(color: Color(0xFFE8E8E8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Image.asset('assets/img/icon.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text('Nguyễn Hữu Thọ (098****321)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text('Dien Bien Phu Street, Ward 22, Binh Thanh District, Ho Chi Minh City',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF282828),)),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      width: 74,
                      height: 74,
                      decoration:BoxDecoration(
                        color: Color(0xFFFBF4ED),
                        borderRadius:BorderRadius.circular(20),
                      ),
                      child: Image.asset('assets/img/map.png'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tóm tắt đơn hàng',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,),),
                  Text('Thêm món',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                border: Border(bottom:BorderSide(color: Color(0xFFE6E6E6)) ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 10,left: 10),
                        decoration:BoxDecoration(
                          border: Border.all(color: Color(0xFFDDDDE3)),
                          borderRadius:BorderRadius.circular(4),
                        ),
                        child: Center(child: Text('x1',style: TextStyle(color: Color(0xFFFB9116)),))),
                    Container(
                      width: 320,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sữa Tươi Trân Chân Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF222222)),),
                              Text('Size M',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF6C6C6C)),),
                              Text('Chỉnh sửa',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                            ],
                          ),
                          Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                border: Border(bottom:BorderSide(color: Color(0xFFE6E6E6)) ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 10,left: 10),
                        decoration:BoxDecoration(
                          border: Border.all(color: Color(0xFFDDDDE3)),
                          borderRadius:BorderRadius.circular(4),
                        ),
                        child: Center(child: Text('x1',style: TextStyle(color: Color(0xFFFB9116)),))),
                    Container(
                      width: 320,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sữa Tươi Trân Chân Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF222222)),),
                              Text('Size M',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF6C6C6C)),),
                              Text('Chỉnh sửa',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                            ],
                          ),
                          Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                border: Border(bottom:BorderSide(color: Color(0xFFE6E6E6)) ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 10,left: 10),
                        decoration:BoxDecoration(
                          border: Border.all(color: Color(0xFFDDDDE3)),
                          borderRadius:BorderRadius.circular(4),
                        ),
                        child: Center(child: Text('x1',style: TextStyle(color: Color(0xFFFB9116)),))),
                    Container(
                      width: 320,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sữa Tươi Trân Chân Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF222222)),),
                              Text('Size M',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF6C6C6C)),),
                              Text('Chỉnh sửa',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                            ],
                          ),
                          Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFBF4ED),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Sử dụng phiếu giảm giá',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                    Text('Chọn hoặc nhập mã >',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFCFC3B6)),),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text('Thông tin thanh toán',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Color(0xFF282828))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tổng tạm tính',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                        Text('147.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Khuyến mãi',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                        Text('147.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Phương thức thanh toán',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,),),
                        Text('Xem tất cả',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Color(0xFFFB9116)),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFE6E6E6))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Thanh toán trực tiếp',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                          Radio(
                              value: 1, groupValue: 0, onChanged: null,

                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFE6E6E6))),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ví điện tử MoMo',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                          Radio(
                            value: 2, groupValue: 1, onChanged: null,

                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ngân hàng điện tử',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF525252)),),
                          Radio(
                            value: 0, groupValue: 1, onChanged: null,

                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFFBF4ED),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng cộng',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Color(0xFF222222)),),
                  Text('147.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Color(0xFF222222)),),
                ],
              ),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFFFB9116)),

                  ),
                  onPressed:(){}, child:Text('Đặt hàng',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Colors.white),)
              ),
            ),
          ],
        ),
      ),


    );
  }
}

