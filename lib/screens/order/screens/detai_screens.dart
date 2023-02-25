import 'package:flutter/material.dart';

class DetailOrder extends StatefulWidget {
  const DetailOrder({Key? key}) : super(key: key);

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 230,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          label: const Text('Chi tiết đơn hàng #22899', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Image.asset('assets/images/order.png'),
                    // Positioned(
                    //   bottom: 6,
                    //   right: 20,
                    //   left: 20,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(10),
                    //     child: Container(
                    //       padding: EdgeInsets.all(10),
                    //       color: Colors.white,
                    //       child: Row(
                    //         children: [
                    //           Text('Đang chuẩn bị',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                    //           ElevatedButton(
                    //               onPressed: onPressed,
                    //               style: ButtonStyle(
                    //                 padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    //               ),
                    //               child: Text('Liên hệ hỗ trợ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFFFFFFFF)),),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
