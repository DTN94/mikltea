import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import '../../cart/provider/cart_provider.dart';
import '../../cart/screens/cart_screens.dart';
import '../model/product_dio.dart';
import '../model/product_model.dart';


class DetailProduct extends ConsumerStatefulWidget {
  final num id ;
  const DetailProduct({Key? key, required this.id}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends ConsumerState<DetailProduct> with TickerProviderStateMixin{
  late TabController tabController;
  int indexTab = 0;
  int _counter = 1;
  int _activeColor = 1;

  void _incrementCounter() {
    setState(() { _counter++;});
  }
  void _incrementCounter1() {
    setState(() {
      if(_counter > 1){ _counter--; }
    });
  }
  void _activeSize(int size) {
    setState(() { _activeColor = size;});
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
    final detail = ref.watch(futureDetailProductProvider(widget.id.toString()));
    // final cartState = ref.watch(cartProvider);
    // if(cartState.status == CartStatus.Success){
    //   _myBox.put( cartState.id_product, [ cartState.id_product, cartState.qty, cartState.price ]);
    //   // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
    // }
    // print(_myBox.get);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          label: const Text(''),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ) ,
      extendBodyBehindAppBar: true,
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              detail.when(
                error: (err, stack) => Text('Error: $err'),
                data: (ProductModel? detail){
                  return Column(
                    children: [
                      GFCarousel(
                        height: 400,
                        items: detail!.images!.map((url) {
                          return Container(
                            margin: EdgeInsets.all(0),
                            child: ClipRRect(
                              child: Image.network(url,fit: BoxFit.fitHeight),
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
                                    Text((detail.title).toString(),style: TextStyle(fontSize: 20,color: Colors.black),),
                                    Text(NumberFormat("#,###", "en_US").format((detail.price)) +" đ",
                                        style: TextStyle(fontSize: 25,color: Color(0xFFFB9116))
                                    ),
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
                              width: MediaQuery.of(context).size.width - 40,
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
                            Column(
                              children: [
                                Visibility(
                                  visible: indexTab == 0 ? true : false,
                                  child: Text((detail.description).toString(),
                                    style: TextStyle(fontSize: 14,color: Color(0xFF656565),height: 1.9),
                                  ),
                                ),
                                Visibility(
                                  visible: indexTab == 1 ? true : false,
                                  child: Text(
                                    "Trong tim mỗi người luôn có một ly trà ngon, lúc rãnh rỗi sau buổi chiều, cùng với ánh hoàng hôn ấm áp, cơn gió nhẹ phảng phất dễ chịu, nụ cười ngọt ngào của người yêu",
                                    style: TextStyle(fontSize: 14,color: Color(0xFF656565),height: 1.9),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Size : ',style: TextStyle(fontSize: 20,color: Colors.black),),
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                  ),
                                  onPressed: () {
                                    return _activeSize(1);
                                  },
                                  child: Text('M',style: TextStyle(fontSize: 16,color: _activeColor == 1? Color(0xFFFB9116):Colors.black)),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                  ),
                                  onPressed: () {
                                    return _activeSize(2);
                                  },
                                  child: Text('L',style: TextStyle(fontSize: 16,color: _activeColor == 2? Color(0xFFFB9116):Colors.black)),
                                )
                              ],
                            ),
                            SizedBox(height: 15),

                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: GFButton(
                                    onPressed: (){ _incrementCounter1(); },
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
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                      hintText: '$_counter',
                                      contentPadding: EdgeInsets.only(top: 5),
                                    ),
                                    style: TextStyle(fontSize: 18),
                                    onChanged: (String val) {
                                      ref.read(cartProvider.notifier).onChange(int.parse(val));
                                    },
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: GFButton(
                                    onPressed: (){ _incrementCounter(); },
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
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                                        },
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
                                    onPressed: (){
                                      ref.read(cartProvider.notifier).AddCart(detail.id.toString(),detail.title.toString(),detail.images![0].toString(),int.parse(detail.price.toString()));
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                                    },
                                    text: "Thêm Vào Giỏ Hàng",
                                    color: Color(0xFFFB9116),
                                    shape: GFButtonShape.pills,
                                    size: GFSize. LARGE,
                                    textStyle: TextStyle(fontSize: 15,color: Color(0xFFFFFFFF)),
                                    textColor: Color(0xFFFB9116),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  );
                },
                loading: () => Container( height: 900 ,child: Center(child: CircularProgressIndicator())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

