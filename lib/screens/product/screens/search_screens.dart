import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/product_model.dart';
import '../provider/search_provider.dart';
import 'widgets/bottombar.dart';
import 'widgets/product_widget.dart';
import 'widgets/search_widget.dart';


var keyword= '';
List<ProductModel> items = [];

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    items = searchState.listProducts;
    keyword = searchState.keyword;

    return Scaffold(
      backgroundColor: Colors.white,
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
              Column(
                children: [
                  items.length > 0 ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Từ khóa: ' + '\' $keyword \'', style: TextStyle(fontSize: 14,color: Colors.black)),
                          Text('Gồm: ' + items.length.toString() +' sản phẩm', style: TextStyle(fontSize: 14,color: Colors.black)),
                        ],
                      ),
                      SizedBox(height: 10),
                      GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 210,
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          itemCount: items.length,
                          itemBuilder: (context, i) {
                            return ItemProduct(item: items[i]);
                          }
                      ),
                    ],
                  ) : Center(
                    child: Text('Không tìm thấy sản phẩm nào.'),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}