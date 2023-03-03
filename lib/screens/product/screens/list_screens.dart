import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';

import '../model/categories_model.dart';
import '../model/product_dio.dart';
import '../model/product_model.dart';
import 'home_screens.dart';
import 'widgets/bottombar.dart';
import 'widgets/product_widget.dart';
import 'widgets/search_widget.dart';

class ListProduct extends ConsumerStatefulWidget {
  const ListProduct({Key? key, required this.id}) : super(key: key);
  final num id;

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends ConsumerState<ListProduct> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(futureListCategoryProvider);
    final list_product = ref.watch(futureProductCategoryProvider(widget.id.toString()));
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

              categories.when(
                error: (err, stack) => Text('Error: $err'),
                data: (List<CategoriesModel>? data){
                  if(data != null){
                    return SizedBox(
                      height: 25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, i) {
                          return Container(
                            margin: EdgeInsets.only(right: 25),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ListProduct(id: num.parse(data[i].id.toString()))));
                              },
                              child: Text(data[i].name.toString(),
                                style: TextStyle(fontSize: 15,color: widget.id.toString() == data[i].id.toString()? Color(0xFFFB9116):Colors.black,fontFamily: 'Oswald-Medium'),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }else{
                    return Container();
                  }
                },
                loading: () =>  Center(child: CircularProgressIndicator()),
              ),

              SizedBox(height: 15),
              list_product.when(
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
      bottomNavigationBar: BottomBar(),
    );
  }
}
