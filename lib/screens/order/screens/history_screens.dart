import 'package:flutter/material.dart';

import 'detai_screens.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 180,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          label: const Text('Lịch sử đặt hàng', style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Color(0xFFF5F5FA),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailOrder()));
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 7),
                                  color: Color(0xFFEFFFF4),
                                  child: Text('Đã giao hàng',style: TextStyle(fontSize: 14, color: Color(0xFF00AB56)))
                              ),
                            ),
                            Text('30/11/2022, 4:20',style: TextStyle(fontSize: 14, color: Color(0xFF808089))),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.storefront,color: Color(0xFF1A94FF),size: 25),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('CVPM Quang Trung, P. Tân Chánh Hiệp, Quận 12',style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(height: 1,child: Container(color: Color(0xFFE6E6E6))),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset('assets/images/icon_maps1.png'),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Đường Điện Biên Phủ, Phường 22, Quận Bình Thạnh, HCM',style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                    'Sữa tươi trân châu đường đen (x1), Trà Xoài Kem Cheese (x1), Trà trái cây nhiệt đới (x1)',
                                    style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(left: 15,top: 2),
                                    child: Text('147.000đ',style: TextStyle(fontSize: 15, color: Color(0xFF222222)))
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailOrder()));
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 7),
                                  color: Color(0xFFFFF0F1),
                                  child: Text('Đã giao hàng',style: TextStyle(fontSize: 14, color: Color(0xFFFF424E)))
                              ),
                            ),
                            Text('30/11/2022, 4:20',style: TextStyle(fontSize: 14, color: Color(0xFF808089))),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.storefront,color: Color(0xFF1A94FF),size: 25),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('CVPM Quang Trung, P. Tân Chánh Hiệp, Quận 12',style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(height: 1,child: Container(color: Color(0xFFE6E6E6))),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset('assets/images/icon_maps1.png'),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Đường Điện Biên Phủ, Phường 22, Quận Bình Thạnh, HCM',style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                    'Sữa tươi trân châu đường đen (x1), Trà Xoài Kem Cheese (x1), Trà trái cây nhiệt đới (x1)',
                                    style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(left: 15,top: 2),
                                    child: Text('147.000đ',style: TextStyle(fontSize: 15, color: Color(0xFF222222)))
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailOrder()));
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 7),
                                  color: Color(0xFFEFFFF4),
                                  child: Text('Đã giao hàng',style: TextStyle(fontSize: 14, color: Color(0xFF00AB56)))
                              ),
                            ),
                            Text('30/11/2022, 4:20',style: TextStyle(fontSize: 14, color: Color(0xFF808089))),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.storefront,color: Color(0xFF1A94FF),size: 25),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('CVPM Quang Trung, P. Tân Chánh Hiệp, Quận 12',style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(height: 1,child: Container(color: Color(0xFFE6E6E6))),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Image.asset('assets/images/icon_maps1.png'),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Đường Điện Biên Phủ, Phường 22, Quận Bình Thạnh, HCM',style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                    'Sữa tươi trân châu đường đen (x1), Trà Xoài Kem Cheese (x1), Trà trái cây nhiệt đới (x1)',
                                    style: TextStyle(fontSize: 14, color: Color(0xFF222222)))
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(left: 15,top: 2),
                                    child: Text('147.000đ',style: TextStyle(fontSize: 15, color: Color(0xFF222222)))
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
