import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mikltea/screens/product/screens/home_screens.dart';
import 'package:mikltea/screens/product/screens/list_screens.dart';
import 'package:mikltea/screens/product/screens/product_screens.dart';
import 'package:mikltea/screens/product/widgets/search_widget.dart';

import '../widgets/product_widget.dart';

class ListProduct1 extends StatefulWidget {
  const ListProduct1({Key? key}) : super(key: key);

  @override
  State<ListProduct1> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct1> {
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
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Thưởng thức trà sữa ngon',
                style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Oswald-Medium'),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              Search(),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageProduct()));
                      },
                      child: Text('Trà Sữa',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Oswald-Medium'),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ListProduct()));
                      },
                      child: Text('Trà Trái cây',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Oswald-Medium'),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text('Nước ép',
                      style: TextStyle(fontSize: 14,color: Color(0xFFFB9116),fontFamily: 'Oswald-Medium'),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                children: [
                  ItemProduct(),
                  ItemProduct(),
                  ItemProduct(),
                  ItemProduct(),
                  ItemProduct(),
                  ItemProduct(),
                  ItemProduct(),
                  ItemProduct(),
                ],
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: GFButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                  },
                  text: "Xem Thêm",
                  color: Color(0xFFFB9116),
                  padding: EdgeInsets.only(left: 50,right: 50),
                  shape: GFButtonShape.pills,
                  size: GFSize.MEDIUM,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
