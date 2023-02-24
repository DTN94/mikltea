import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants/api_product_constant.dart';
import '../../../models/api_product_model.dart';
import '../../../models/order_models.dart';
import '../../../models/product_model.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    final CartItem = ListOrder(
        "101",
        "Đang chuẩn bị",
        "30/11/2022",
        "4:20",
        "CVPM Quang Trung,P. Tân Chánh Hiệp, Quận 12",
        "Đường Điện Biên Phủ, Phường 22, Quận Bình Thạnh, HCM",
        "Sữa tươi trân châu đường đen (x1), Trà Xoài Kem Cheese (x1), Trà trái cây nhiệt đới (x1)",
        147000);
    late Future<List<ApiProduct>> listCart = ApiConstants.getListCart();

    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết đơn hàng #${CartItem.mdh}",
            style: const TextStyle(
                fontFamily: 'Oswald',
                color: Color(0xff222222),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      backgroundColor: const Color(0xffF5F5FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              child: Image.asset("assets/images/order_detail.png",
                  fit: BoxFit.cover, width: double.infinity),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 20, right: 20, bottom: 0),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 0, left: 8, right: 8, bottom: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(CartItem.trangthai,
                          style: const TextStyle(
                              fontFamily: 'Oswald',
                              color: Color(0xff222222),
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffFB9116),
                            minimumSize: const Size(100, 30) // NEW,
                            ),
                        onPressed: () {},
                        child: const Text(
                          'Liên hệ hỗ trợ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 0, left: 0, bottom: 10, right: 0),
                    child: const Text(
                      "Thông tin chung",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Color(0xff222222),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Mã đơn hàng",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              CartItem.mdh,
                              style: const TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 0, top: 10, right: 0, bottom: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5,
                                  color: const Color(0xffEBEBF0),
                                  strokeAlign: BorderSide.strokeAlignCenter)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Thời gian đặt hàng",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              style: const TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                              "${CartItem.ngay}, ${CartItem.gio}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 0, bottom: 10, right: 0),
                    child: const Text(
                      "Chi tiết vận chuyển",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Color(0xff222222),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              child: Image.asset("assets/images/icon_home.png",
                                  width: 24),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, top: 0, right: 0, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Từ cửa hàng",
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Color(0xff777777),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    CartItem.diachicuahang,
                                    style: const TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Color(0xff222222),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 0, top: 10, right: 0, bottom: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5,
                                  color: const Color(0xffEBEBF0),
                                  strokeAlign: BorderSide.strokeAlignCenter)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              child: Image.asset("assets/images/icon_map.png",
                                  width: 24),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, top: 0, right: 0, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Đến",
                                    style: TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Color(0xff777777),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    CartItem.diachinhan,
                                    style: const TextStyle(
                                        fontFamily: 'Oswald',
                                        color: Color(0xff222222),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 0, bottom: 10, right: 0),
                    child: const Text(
                      "Thông tin sản phẩm",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Color(0xff222222),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  FutureBuilder<List<ApiProduct>>(
                    future: listCart,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            snapshot.data![index].images![0]
                                                .toString(),
                                            fit: BoxFit.cover,
                                            width: 55,
                                            height: 55,
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 10,
                                              top: 0,
                                              right: 0,
                                              bottom: 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data![index].title
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontFamily: 'Oswald',
                                                    color: Color(0xff222222),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const Text(
                                                "Size: M",
                                                style: TextStyle(
                                                    fontFamily: 'Oswald',
                                                    color: Color(0xff6C6C6C),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                "${NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0).format(snapshot.data![index].price)} x1",
                                                style: const TextStyle(
                                                    fontFamily: 'Oswald',
                                                    color: Color(0xff222222),
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 0,
                                          top: 10,
                                          right: 0,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.5,
                                              color: const Color(0xffEBEBF0),
                                              strokeAlign: BorderSide
                                                  .strokeAlignCenter)),
                                    ),
                                  ],
                                );
                              }),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Error'),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.cyanAccent),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 0, bottom: 10, right: 0),
                    child: const Text(
                      "Thông tin thanh toán",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Color(0xff222222),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            child: Image.asset(
                          "assets/images/icon_momo.png",
                          fit: BoxFit.contain,
                        )),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 0, left: 10, bottom: 0, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Phương thức thanh toán",
                                style: TextStyle(
                                    fontFamily: 'Oswald',
                                    color: Color(0xff777777),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                "Momo",
                                style: TextStyle(
                                    fontFamily: 'Oswald',
                                    color: Color(0xff222222),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 0, bottom: 10, right: 0),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Tổng tạm tính",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff525252),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "147.000đ",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff525252),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Khuyến mãi",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff525252),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "0đ",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff525252),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Tổng cộng",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "147.000đ",
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  color: Color(0xff222222),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
