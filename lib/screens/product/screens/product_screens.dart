import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mikltea/screens/product/screens/list1_screens.dart';
import 'package:mikltea/screens/product/screens/list_screens.dart';
import 'package:mikltea/screens/product/widgets/product_widget.dart';
import 'package:mikltea/screens/product/widgets/search_widget.dart';

import '../model/product_dio.dart';
import '../model/product_model.dart';



final List<String> imageList = [
  "assets/images/avatar.jpg",
  "assets/images/product_top.png",
  "assets/images/avatar.jpg",
  "assets/images/product_top.png",
  "assets/images/avatar.jpg",
  "assets/images/product_top.png"
];


class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(futureListProductProvider);

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
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50),
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
                    child: Text('Trà Sữa',
                      style: TextStyle(fontSize: 14,color: Color(0xFFFB9116),fontFamily: 'Oswald-Medium'),
                      textAlign: TextAlign.left,
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
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ListProduct1()));
                      },
                      child: Text('Nước ép',
                        style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Oswald-Medium'),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              GFCarousel(
                items: imageList.map((url) {
                    return Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.only(bottom: 35),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(url,
                          fit: BoxFit.cover,
                          width: 1000.0,
                        ),
                      ),
                    );
                  },
                ).toList(),
                viewportFraction: 1.0,
                autoPlay: true,
                hasPagination: true,
                activeIndicator: Color(0xFFFB9116),
                enableInfiniteScroll: true,
                reverse: true,
                pagerSize: 13.0,
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phổ Biến Nhất',style: TextStyle(fontSize: 15,fontFamily: 'Oswald-Medium',color: Colors.black),),
                  Text('Xem tất cả',style: TextStyle(fontSize: 12,color: Color(0xFFFB9116)),),
                ],
              ),
              SizedBox(height: 20),
              list.when(
                error: (err, stack) => Text('Error: $err'),
                data: (List<ProductModel>? data){
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, i) {
                        return ItemProduct(item: data![i]);
                      },
                    ),
                  );
                },
                loading: () =>  Center(child: CircularProgressIndicator()),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Seller',style: TextStyle(fontSize: 15,fontFamily: 'Oswald-Medium',color: Colors.black),),
                  Text('Xem tất cả',style: TextStyle(fontSize: 12,color: Color(0xFFFB9116)),),
                ],
              ),
              SizedBox(height: 10),
              list.when(
                error: (err, stack) => Text('Error: $err'),
                data: (List<ProductModel>? data){
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 205,childAspectRatio:0.9),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, i) {
                      return ItemProduct(item: data![i]);
                    },
                  );
                },
                loading: () => Center(child: const CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}