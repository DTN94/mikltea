import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 50,
        iconTheme: IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
      ) ,
      extendBodyBehindAppBar: true,
      body:SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset('assets/images/detail.png',fit: BoxFit.cover),
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
                    GFTabBar(
                      length: 2,
                      tabBarColor: Colors.transparent,
                      controller: tabController,
                      isScrollable: false,
                      indicatorColor: Color(0xFFFB9116),
                      indicatorPadding: EdgeInsets.all(0),
                      indicatorWeight: 3,
                      tabBarHeight: 50,
                      shape: Border(bottom: BorderSide(color: Color(0xFFEFEFEF))),
                      tabs: [
                        Tab(
                          child: Text(
                              "Chi tiết",
                            style: TextStyle(fontSize: 15,color: Color(0xFFFB9116)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Thành phần",
                            style: TextStyle(fontSize: 15,color: Color(0xFF656565)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GFTabBarView(
                        controller: tabController,
                        height: 120,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Trong tim mỗi người luôn có một ly trà ngon, lúc rãnh rỗi sau buổi chiều, cùng với ánh hoàng hôn ấm áp, cơn gió nhẹ phảng phất dễ chịu, nụ cười ngọt ngào của người yêu, vị ngọt lưu lại trong miệng, hồi tưởng cảm xúc lần đầu nếm được mùi vị trà ngon",
                              style: TextStyle(fontSize: 14,color: Color(0xFF656565),height: 1.9),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Trong tim mỗi người luôn có một ly trà ngon, lúc rãnh rỗi sau buổi chiều, cùng với ánh hoàng hôn ấm áp, cơn gió nhẹ phảng phất dễ chịu, nụ cười ngọt ngào của người yêu, vị ngọt lưu lại trong miệng, hồi tưởng cảm xúc lần đầu nếm được mùi vị trà ngon",
                              style: TextStyle(fontSize: 14,color: Color(0xFF656565),height: 1.9),
                            ),
                          ),
                        ]
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Size : ',style: TextStyle(fontSize: 20,color: Colors.black),),
                        GFButton(
                          onPressed: (){},
                          text: "M",
                          type: GFButtonType.transparent,
                          textStyle: TextStyle(fontSize: 16,color: Color(0xFFFB9116),fontFamily: "Oswald-Regular")
                        ),
                        GFButton(
                          onPressed: (){},
                          text: "L",
                          type: GFButtonType.transparent,
                          textStyle: TextStyle(fontSize: 16,color: Colors.black,fontFamily: "Oswald-Regular"),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: GFButton(
                            onPressed: (){},
                            text: "-",
                            type: GFButtonType.outline,
                            shape: GFButtonShape.pills,
                            textStyle: TextStyle(fontSize: 25,color: Color(0xFFFB9116)),
                            color: Color(0xFFFB9116),
                            focusColor: Color(0xFFFB9116),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(left: 10,right: 10),
                          child: TextField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                              hintText: '2',
                              contentPadding: EdgeInsets.only(top: 5),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: GFButton(
                            onPressed: (){},
                            text: "+",
                            type: GFButtonType.outline,
                            shape: GFButtonShape.pills,
                            textStyle: TextStyle(fontSize: 20,color: Color(0xFFFB9116)),
                            color: Color(0xFFFB9116),
                            focusColor: Color(0xFFFB9116),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
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

