import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/getwidget.dart';

import '../../../model/api_produt_model.dart';





class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  late Future<List<ApiProduct>> getProduct;
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/img/av.png'),
                Text('Xin Chào Huu Tho !',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color( 0xFF656565)),),
              ],
            )
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Row(
              children: [
                GestureDetector(
                  /*onTap: () => MaterialPageRoute(builder: (context) => ,),*/
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF5EB),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Image.asset('assets/img/heart.png'),
                  ),
                ),
                GestureDetector(
                  /*onTap: () => MaterialPageRoute(builder: (context) => ,),*/
                  child: Container(
                    width: 32,
                    height: 32,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffFFF5EB),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Image.asset('assets/img/Bag.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('Thưởng thức trà sữa ngon',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w300, color: Color(0xFF727272)),

                  decoration: InputDecoration(

                    filled: true,
                    fillColor: Color(0xFFF5F5FA),
                    labelStyle: const TextStyle(
                      color: Color(0xFF727272),
                    ),
                    hintText: 'Tìm kiếm',

                    contentPadding: EdgeInsets.symmetric( horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: InkWell(
                      onTap: () {
                        /*Navigator.push(context, MaterialPageRoute(builder: (context) => ()));*/
                      },
                      child: (Text('Trà Sữa',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xffFB9116)),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: InkWell(
                      onTap: () {
                        /*Navigator.push(context, MaterialPageRoute(builder: (context) => ()));*/
                      },
                      child: (Text('Trà Trái Cây',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: InkWell(
                      onTap: () {
                        /*Navigator.push(context, MaterialPageRoute(builder: (context) => ()));*/
                      },
                      child: (Text('Nước Ép',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)),
                    ),
                  ),
                ],
              ),
            ),
            GFCarousel(
              viewportFraction: 1.0,
              hasPagination:true,
              activeIndicator:Color(0xffFB9116),
              passiveIndicator:Color(0xffD9D9D9),
              pagerSize:8,
              autoPlay: true,
              items: imageList.map(
                    (url) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 20),
                    margin: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          width: 1000.0
                      ),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phổ Biến Nhất',style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,color: Color(0xff252525) ),),
                  Text('Xem tất cả',style: TextStyle(fontSize:12,fontWeight: FontWeight.w300,color: Color(0xffFB9116) ),)
                ],
              ),
            ),
            Container(
              height: 158,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Container(
                      color: Color(0XFFDEF4FF),
                      width: 138,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/image1.png'),
                          Text('Trân Châu Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFF222222)),),
                          Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFFFB9116)),),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Container(
                      color: Color(0XFFDEF4FF),
                      width: 138,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/image1.png'),
                          Text('Trân Châu Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFF222222)),),
                          Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFFFB9116)),),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Container(
                      color: Color(0XFFDEF4FF),
                      width: 138,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/image1.png'),
                          Text('Trân Châu Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFF222222)),),
                          Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFFFB9116)),),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:Container(
                      color: Color(0XFFDEF4FF),
                      width: 138,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/img/image1.png'),
                          Text('Trân Châu Đường Đen',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFF222222)),),
                          Text('49.000đ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0XFFFB9116)),),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Seller',style: TextStyle(fontSize:15,fontWeight: FontWeight.w500,color: Color(0xff252525) ),),
                  Text('Xem tất cả',style: TextStyle(fontSize:12,fontWeight: FontWeight.w300,color: Color(0xffFB9116) ),)
                ],
              ),
            ),
            FutureBuilder<ApiProduct>(
            future: List<ApiProduct>,
            builder: (context, snapshot)
            {
              if(snapshot.hasData){
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: [
                    for (var i = 0; i < 10; i++)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Color(0XFFEFE3FF),
                          height: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/img/ts.png'),
                              const Text('Trân Châu Đường Đen', style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Color(0XFF222222)),),
                              const Text('49.000đ', style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Color(0XFFFB9116)),),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              }


            }
            ),

          ],
        ),
      ),)
    );
  }
}










