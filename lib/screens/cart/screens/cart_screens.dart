import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import '../../product/screens/widgets/bottombar.dart';
import '../model/cart_model.dart';
import '../provider/cart_provider.dart';
import 'payment_screens.dart';

var keyword= '';
List<CartModel> items = [];

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    items = cartState.listCarts;
    num total = 0;
    for(int i = 0;i < items.length;i++){
      total += num.parse(items[i].price.toString()) * num.parse(items[i].qty.toString());
    };

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 130,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          label: const Text('Giỏ hàng', style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,bottom: 20,right: 20,top: 10),
          child: Column(
            children: [
              items.length > 0 ? Column(
                children: [
                  for(int i = 0;i < items.length;i++)...[
                    Container(
                      height: 140,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFE8E8E8)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  color: Color(0xFFEFE3FF),
                                  child: Image.network(items[i].photo.toString(),fit: BoxFit.fitHeight,height: 120,),
                                ),
                              )
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(left: 20,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(items[i].title.toString(),style: TextStyle(fontSize: 14,color: Color(0xFF222222)),),
                                    SizedBox(height: 10),
                                    Text('Size M',style: TextStyle(fontSize: 14,color: Color(0xFF6C6C6C)),),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(NumberFormat("#,###", "en_US").format((items[i].price! * num.parse(items[i].qty.toString()))) +" đ",
                                            style: TextStyle(fontSize: 14,color: Color(0xFF222222))
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  child: GFButton(
                                                    onPressed: (){},
                                                    text: "-",
                                                    type: GFButtonType.outline,
                                                    shape: GFButtonShape.pills,
                                                    textStyle: TextStyle(fontSize: 22,color: Color(0xFFFB9116)),
                                                    color: Color(0xFFFB9116),
                                                    focusColor: Color(0xFFFB9116),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  margin: EdgeInsets.only(left: 5,right: 5),
                                                  child: TextFormField(
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical: TextAlignVertical.center,
                                                    style: TextStyle(fontSize: 14),
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                                      hintText: items[i].qty.toString(),
                                                      contentPadding: EdgeInsets.only(top: 5),
                                                    ),
                                                    onChanged: (String val) {
                                                      ref.read(cartProvider.notifier).onChange(int.parse(val));
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  child: GFButton(
                                                    onPressed: (){
                                                    },
                                                    text: "+",
                                                    type: GFButtonType.outline,
                                                    shape: GFButtonShape.pills,
                                                    textStyle: TextStyle(fontSize: 18,color: Color(0xFFFB9116)),
                                                    color: Color(0xFFFB9116),
                                                    focusColor: Color(0xFFFB9116),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ]
                ],
              ) : Center(
                child: Text('Giỏ hàng rỗng.'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Color(0xFFFBF4ED),
                  padding: EdgeInsets.all(20),
                  width: 1000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng tạm tính',style: TextStyle(fontSize: 14,color: Color(0xFF656565))),
                          Text(NumberFormat("#,###", "en_US").format(total) + " đ",style: TextStyle(fontSize: 15,color: Color(0xFF656565))),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Khuyến mãi',style: TextStyle(fontSize: 14,color: Color(0xFF656565))),
                          Text('0đ',style: TextStyle(fontSize: 14,color: Color(0xFF656565))),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng cộng',style: TextStyle(fontSize: 15,color: Color(0xFF222222))),
                          Text(NumberFormat("#,###", "en_US").format(total) + " đ",style: TextStyle(fontSize: 16,color: Color(0xFF222222))),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        child: GFButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PayMentPage()));
                          },
                          text: "Tiếp Tục",
                          color: Color(0xFFFB9116),
                          padding: EdgeInsets.only(left: 50,right: 50),
                          shape: GFButtonShape.pills,
                          size: GFSize.LARGE,
                          textStyle: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
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
