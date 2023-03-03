import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import '../../product/provider/cart_provider.dart';
import '../../product/screens/home_screens.dart';
import 'cart_screens.dart';
import 'success_screens.dart';

class PayMentPage extends ConsumerStatefulWidget {
  const PayMentPage({Key? key}) : super(key: key);

  @override
  _PayMentPageState createState() => _PayMentPageState();
}

class _PayMentPageState extends ConsumerState<PayMentPage> with TickerProviderStateMixin{
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
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
        leadingWidth: 180,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          label: const Text('Tóm tắt yêu cầu', style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600)),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Color(0xFFE8E8E8)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset('assets/images/icon_maps.png')
                                ),
                                Text('Nguyễn Văn A',style: TextStyle(fontSize: 15,color: Color(0xFF282828))),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('Dien Bien Phu Street, Ward 22, Binh Thanh District, Ho Chi Minh City',style: TextStyle(fontSize: 14,color: Color(0xFF282828)),)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/maps.png',fit: BoxFit.fitWidth)
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tóm tắt đơn hàng',style: TextStyle(fontSize: 14,color: Colors.black),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                    },
                    child: Text('Thêm món',
                      style: TextStyle(fontSize: 13,color: Color(0xFFFB9116)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              for(int i = 0;i < items.length;i++)...[
                _itemOrder(items[i]),
              ],
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Color(0xFFFBF4ED),
                  padding: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
                  width: 1000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sử dụng phiếu giảm giá',style: TextStyle(fontSize: 14,color: Color(0xFF525252))),
                          Row(
                            children: [
                              Text('Chọn hoặc nhập mã',style: TextStyle(fontSize: 14,color: Color(0xFFCFC3B6))),
                              Icon(Icons.chevron_right,size: 20,color: Color(0xFFCFC3B6))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Thông tin thanh toán',style: TextStyle(fontSize: 14,color: Colors.black),),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng tạm tính',style: TextStyle(fontSize: 14,color: Color(0xFF656565))),
                  Text(NumberFormat("#,###", "en_US").format(total) + " đ",style: TextStyle(fontSize: 14,color: Color(0xFF656565))),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Khuyến mãi',style: TextStyle(fontSize: 14,color: Color(0xFF656565))),
                  Text('0đ',style: TextStyle(fontSize: 14,color: Color(0xFF656565),fontFamily: 'Oswald-Medium')),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phương thức thanh toán',style: TextStyle(fontSize: 14,color: Colors.black),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                    },
                    child: Text('Xem tất cả',
                      style: TextStyle(fontSize: 13,color: Color(0xFFFB9116)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _payMent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 125,
        color: Color(0xFFFBF4ED),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tổng cộng',style: TextStyle(fontSize: 15,color: Color(0xFF222222))),
                Text(NumberFormat("#,###", "en_US").format(total) + " đ",style: TextStyle(fontSize: 15,color: Color(0xFF222222))),
              ],
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: GFButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSuccess()));
                },
                text: "Đặt Hàng",
                color: Color(0xFFFB9116),
                padding: EdgeInsets.only(left: 50,right: 50),
                shape: GFButtonShape.pills,
                fullWidthButton: true,
                size: GFSize.LARGE,
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOrder(itemcart){
    return Container(
      child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15 ,bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(right: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Color(0xFFE8E8E8)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Text('X'+itemcart.qty.toString(),style: TextStyle(fontSize: 16,color: Color(0xFFFB9116)))
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(itemcart.title.toString(),style: TextStyle(fontSize: 14,color: Color(0xFF222222)),),
                      SizedBox(height: 5),
                      Text('Size M',style: TextStyle(fontSize: 14,color: Color(0xFF6C6C6C)),),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                        },
                        child: Text('Chỉnh sửa',
                          style: TextStyle(fontSize: 13,color: Color(0xFFFB9116)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(NumberFormat("#,###", "en_US").format(itemcart.price * itemcart.qty) + " đ",style: TextStyle(fontSize: 15,color: Color(0xFF222222)),textAlign: TextAlign.end),
                )
              ],
            ),
          ),
          SizedBox(height: 1,child: Container(color: Color(0xFFE6E6E6),),)
        ],
      ),
    );
  }

  Widget _payMent(){
    return Column(
      children: [
        GFRadioListTile(
          title: Text('Thanh toán trực tiếp',style: TextStyle(fontSize: 14,color: Color(0xFF525252))),
          size: 22,
          focusColor: Color(0xFFFB9116),
          activeBorderColor: Color(0xFFFB9116),
          radioColor: Color(0xFFFB9116),
          type: GFRadioType.basic,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          value: 0,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() { groupValue = value; });
          },
          inactiveIcon: null,
        ),
        SizedBox(height: 15),
        SizedBox(height: 1,child: Container(color: Color(0xFFE6E6E6),),),
        SizedBox(height: 15),
        GFRadioListTile(
          title: Text('Ví điện tử MoMo',style: TextStyle(fontSize: 14,color: Color(0xFF525252))),
          size: 22,
          focusColor: Color(0xFFFB9116),
          activeBorderColor: Color(0xFFFB9116),
          radioColor: Color(0xFFFB9116),
          type: GFRadioType.basic,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          value: 1,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value;
            });
          },
          inactiveIcon: null,
        ),
        SizedBox(height: 15),
        SizedBox(height: 1,child: Container(color: Color(0xFFE6E6E6),),),
        SizedBox(height: 15),
        GFRadioListTile(
          title: Text('Ngân hàng điện tử',style: TextStyle(fontSize: 14,color: Color(0xFF525252))),
          size: 22,
          focusColor: Color(0xFFFB9116),
          activeBorderColor: Color(0xFFFB9116),
          radioColor: Color(0xFFFB9116),
          type: GFRadioType.basic,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          value: 2,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value;
            });
          },
          inactiveIcon: null,
        ),
      ],
    );
  }
}
