import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leadingWidth: 50,
        leading:Center(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            width: 30,
            height: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.cover),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: 'Xin Chào ',style: TextStyle(fontSize: 13,color: Color(0xFF656565),fontFamily: "Oswald-Regular"),),
                      TextSpan(text: 'Nguyen Van A',style: TextStyle(fontSize: 13,color: Color(0xFF656565),fontFamily: 'Oswald-Medium'),)
                    ]
                )
            ),
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Container(
                        width: 32,
                        height: 32,
                        color: Color(0xFFFFF5EB),
                        child: IconButton(onPressed: null, icon: Icon(Icons.favorite, size: 20,),padding: new EdgeInsets.all(5),)
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                      width: 32,
                      height: 32,
                      color: Color(0xFFFFF5EB),
                      child: IconButton(onPressed: null, icon: Icon(Icons.shopping_bag, size: 20,),padding: new EdgeInsets.all(5),)
                  ),
                )
              ],
            ),
          ],
        ),
      ) ,
      body:SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset('assets/images/detail.png',fit: BoxFit.fitWidth),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sữa Tươi Trân Châu Đường Đen',style: TextStyle(fontSize: 20,color: Colors.black),),
                            Text('49.000đ',style: TextStyle(fontSize: 25,color: Color(0xFFFB9116))),
                          ],
                        ),
                        IconButton(onPressed: null, icon: Icon(Icons.favorite, size: 30,color: Color(0xFFFB9116)))
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text('Size : ',style: TextStyle(fontSize: 20,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right:10),
                            child: GFButton(
                              onPressed: (){},
                              text: "Mua Ngay",
                              color: Color(0xFFFAF2EA),
                              shape: GFButtonShape.pills,
                              size: GFSize.LARGE,
                              textStyle: TextStyle(fontSize: 15,color: Color(0xFFFB9116),)
                            ),
                          ),
                        ),
                        Expanded(
                          child: GFButton(
                            onPressed: (){},
                            text: "Thêm Vào Giỏ Hàng",
                            color: Color(0xFFFB9116),
                            shape: GFButtonShape.pills,
                            size: GFSize. LARGE,
                            textStyle: TextStyle(fontSize: 15,color: Color(0xFFFFFFFF)),
                          ),
                        ),
                      ],
                    ),

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

