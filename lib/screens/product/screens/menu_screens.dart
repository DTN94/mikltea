import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/categories_model.dart';
import '../model/product_dio.dart';
import '../model/product_model.dart';
import 'widgets/bottombar.dart';
import 'widgets/product_widget.dart';


class MenuProduct extends ConsumerStatefulWidget {
  const MenuProduct({Key? key}) : super(key: key);

  @override
  _MenuProductState createState() => _MenuProductState();
}

class _MenuProductState extends ConsumerState<MenuProduct> with TickerProviderStateMixin{

  late TabController tabController;
  int indexTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this,initialIndex: indexTab);
    tabController.addListener(_handleTabController);
  }
  _handleTabController(){
    if(tabController.indexIsChanging){
      setState(() {
        indexTab = tabController.index;
      });
    }
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(futureListCategoryProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Menu',style: TextStyle(fontSize: 18, color: Colors.black),),
            IconButton(onPressed: null, icon: Icon(Icons.shopping_bag, size: 25,),padding: new EdgeInsets.all(5),)
          ],
        ),
      ) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(right: 20,bottom: 20,left: 20),
          child: Column(
            children: [
              categories.when(
                error: (err, stack) => Text('Error: $err'),
                data: (List<CategoriesModel>? data){
                  if(data != null){
                    tabController = TabController(length: data.length, vsync: this,initialIndex: indexTab);
                    tabController.addListener(_handleTabController);
                    return TabBar(
                      controller: tabController,
                      isScrollable: true,
                      labelColor: Colors.black,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.all(0),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        for(int i = 0;i < data.length;i++)...[
                          Tab(
                            iconMargin: EdgeInsets.only(right: 0.0),
                            child: Container(
                              padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                              margin: EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: indexTab == i? Colors.transparent:Colors.black,),
                                borderRadius: BorderRadius.circular(50),
                                color: indexTab == i? Color(0xFFFB9116):Colors.white,
                              ),
                              child: Text(data[i].name.toString(),style: TextStyle(fontSize: 14,color: indexTab == i? Colors.white:Colors.black),
                              ),
                            ),
                          )
                        ],
                      ],
                    );
                  }else{
                    return Container();
                  }
                },
                loading: () =>  Center(child: CircularProgressIndicator()),
              ),
              SizedBox(height: 10),
              categories.when(
                error: (err, stack) => Text('Error: $err'),
                data: (List<CategoriesModel>? data){
                  if(data != null){
                    return IndexedStack(
                      index: indexTab,
                      children: [
                        for(int i = 0;i < data.length;i++)...[
                          Visibility(
                            visible: true,
                            child: TabProduct(id: num.parse(data[i].id.toString())),
                          ),
                        ],
                      ],
                    );
                  }else{
                    return Container(
                      child: Center(
                        child: Text("Đang được cập nhật", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red)),
                      ),
                    );
                  }
                },
                loading: () =>  Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class TabProduct extends ConsumerWidget {
  const TabProduct({super.key,required this.id});
  final num id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list_product = ref.watch(futureProductCategoryProvider('$id'));
    return Column(
      children: [
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
      ],
    );
  }
}
