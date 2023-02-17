import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mikltea/screens/product/widgets/product_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text("Page product"),
      ) ,
      body:SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Thưởng thức trà sữa ngon',
                style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Oswald-Medium'),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(500)),
                  hintText: 'Tìm kiếm',
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.only(left: 20,right: 10),
                ),
              ),
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
                    child: Text('Trà Trái cây',
                      style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Oswald-Medium'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text('Nước ép',
                      style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'Oswald-Medium'),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),

              GFCarousel(
                items: imageList.map((url) {
                    return Container(
                      margin: EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.network(url,
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
                pagerSize: 15.0,
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

              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ItemProduct(),
                    ItemProduct(),
                    ItemProduct(),
                    ItemProduct(),
                    ItemProduct(),
                  ],
                ),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
