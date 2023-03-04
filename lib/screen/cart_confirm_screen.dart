import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:milktea/screen/widget/appbar_name_widget.dart';

import '../repository/cart_repository.dart';

class CartConfirm extends ConsumerWidget {
  const CartConfirm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider).carts;
    int totalPrice = ref.watch(cartProvider).getTotal();

    return Scaffold(
      appBar: const AppbarName(
        name: 'Tóm tắt yêu cầu',
        showBadge: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFE8E8E8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icon/location.svg', width: 16, height: 16),
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: const Text(
                                'Nguyễn Hữu Thọ (098****321)',
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text('Dien Bien Phu Street, Ward 22, Binh Thanh District, Ho Chi Minh City',
                              style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF282828))),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBF4ED),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/image/map.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tóm tắt đơn hàng',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go(context.namedLocation('home'));
                    },
                    child: const Text(
                      'Thêm món',
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xFFFB9116)),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFE6E6E6))),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFDDDDE3)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'x${cartItems[index].quantity}',
                              style: const TextStyle(color: Color(0xFFFB9116)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems[index].productName,
                                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF222222)),
                                  ),
                                  /* const Text(
                                    'Size M',
                                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF6C6C6C)),
                                  ), */
                                  GestureDetector(
                                    onTap: () {
                                      context.go(context.namedLocation('cart'));
                                    },
                                    child: const Text(
                                      'Chỉnh sửa',
                                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xFFFB9116)),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(cartItems[index].price),
                                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xff222222)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(color: const Color(0xFFFBF4ED), borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Sử dụng phiếu giảm giá',
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                    ),
                    Text(
                      'Chọn hoặc nhập mã >',
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xFFCFC3B6)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text('Thông tin thanh toán', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Color(0xFF282828))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tổng tạm tính',
                          style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(totalPrice),
                          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Khuyến mãi',
                          style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(0),
                          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Phương thức thanh toán',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Xem tất cả',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xFFFB9116)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFE6E6E6))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Thanh toán trực tiếp',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                      ),
                      Radio(
                        value: 1,
                        groupValue: 0,
                        onChanged: null,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFE6E6E6))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Ví điện tử MoMo',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                      ),
                      Radio(
                        value: 2,
                        groupValue: 1,
                        onChanged: null,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Ngân hàng điện tử',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15, color: Color(0xFF525252)),
                      ),
                      Radio(
                        value: 0,
                        groupValue: 1,
                        onChanged: null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFFBF4ED),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tổng cộng',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xFF222222)),
                  ),
                  Text(
                    NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(totalPrice),
                    style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Color(0xFF222222)),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFFB9116)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Đặt hàng',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
