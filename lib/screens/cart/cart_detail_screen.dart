import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/product.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  List<Product> products = [];

  void _getProducts() {
    products = Product.getProducts();
  }

  var payments = [
    {'name': 'MoMo', 'photo': 'momo.png'},
  ];

  @override
  Widget build(BuildContext context) {
    _getProducts();
    return Scaffold(
      backgroundColor: const Color(0xffF5F5FA),
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  child: Image.asset('assets/images/cart_detail_top.png', width: double.infinity, height: 250, fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Đang chuẩn bị',
                            style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFB9116),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            child: const Text(
                              'Liên hệ hỗ trợ',
                              style: TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Colors.white, fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thông tin chung',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff222222)),
                    ),
                  ),
                  maHD(),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Chi tiết vận chuyển',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff222222)),
                    ),
                  ),
                  chiTietShip(),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thông tin sản phẩm',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff222222)),
                    ),
                  ),
                  listProducts(),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thông tin thanh toán',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff222222)),
                    ),
                  ),
                  listPayments(),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Tổng tạm tính', style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff525252))),
                            const Text('147.000đ', style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Khuyến mãi', style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff525252))),
                            const Text('0đ', style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Tổng cộng', style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff222222))),
                            const Text('147.000đ', style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff222222))),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container listPayments() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        padding: const EdgeInsets.all(15),
        separatorBuilder: ((context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Divider(
                height: 1,
                color: Color(0xffEBEBF0),
              ),
            )),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: payments.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 50,
                    minHeight: 50,
                    maxWidth: 50,
                    maxHeight: 50,
                  ),
                  child: Image.asset(
                    'assets/images/${payments[index]['photo']}',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Phương thức thanh toán',
                      style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xff6C6C6C)),
                    ),
                    Text(
                      payments[index]['name']!,
                      style: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222)),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container listProducts() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListView.separated(
        padding: const EdgeInsets.all(15),
        separatorBuilder: ((context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Divider(
                height: 1,
                color: Color(0xffEBEBF0),
              ),
            )),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 60,
                    minHeight: 60,
                    maxWidth: 60,
                    maxHeight: 60,
                  ),
                  child: Image.asset(
                    'assets/images/products/${products[index].photo}',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index].name,
                      style: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222)),
                    ),
                    Text(
                      products[index].size,
                      style: const TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xff6C6C6C)),
                    ),
                    Text(
                      '${products[index].price}đ x1',
                      style: const TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xff222222)),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container chiTietShip() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            dense: true,
            minLeadingWidth: 10,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/house.svg',
                  width: 25,
                  height: 25,
                ),
              ],
            ),
            title: const Text(
              'Từ cửa hàng',
              style: TextStyle(fontFamily: 'Oswald', fontSize: 13, fontWeight: FontWeight.w300, color: Color(0xff777777)),
            ),
            subtitle: const Text(
              'CVPM Quang Trung, P. Tân Chánh Hiệp, Quận 12',
              style: TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color(0xff222222)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Divider(
              height: 1,
              color: Color(0xffEBEBF0),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
            dense: true,
            minLeadingWidth: 10,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/mark.svg',
                  width: 25,
                  height: 25,
                ),
              ],
            ),
            title: const Text(
              'Đến',
              style: TextStyle(fontFamily: 'Oswald', fontSize: 13, fontWeight: FontWeight.w300, color: Color(0xff777777)),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Đường Điện Biên Phủ, Phường 22, Quận Bình Thạnh, HCM',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color(0xff222222)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Huu Tho',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color(0xff777777), fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/images/dot.svg',
                        width: 5,
                        height: 5,
                      ),
                    ),
                    const Text(
                      '0987 654 321',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color(0xff777777), fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container maHD() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Mã đơn hàng',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const Text(
                  '22899',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(
                height: 1,
                color: Color(0xffEBEBF0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Thời gian đặt hàng',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const Text(
                  '30/11/2022, 4:20',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Chi tiết đơn hàng #22899'),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/Arrow - Left.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 80,
            height: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xffF2F2F2), borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/dots.svg',
                  width: 10,
                  height: 4,
                ),
                const VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 1,
                ),
                SvgPicture.asset(
                  'assets/images/round-x.svg',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
