import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xfff5f5fa)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/image/tk_top.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    ClipPath(
                                      clipper: const ShapeBorderClipper(shape: CircleBorder()),
                                      clipBehavior: Clip.hardEdge,
                                      child: SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: CachedNetworkImage(
                                          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: FittedBox(
                                          child: FloatingActionButton(
                                            backgroundColor: Colors.white,
                                            onPressed: () {},
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: Color(0xff868686),
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'NGUYEN HUU THO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      '0987654321',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                              onPressed: () {
                                context.go(context.namedLocation('account_info'));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Thông tin tài khoản',
                                    style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: Color(0xff222222),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Đổi mật khẩu',
                                    style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: Color(0xff222222),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Ưu đãi & khuyến mãi',
                                    style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: Color(0xff222222),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Thông báo',
                                    style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: Color(0xff222222),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Điều khoản & quy định',
                            style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w600, color: Color(0xff222222)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Quy định sử dụng',
                                style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Color(0xff222222),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Chính sách giải quyết khiếu nại',
                                style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Color(0xff222222),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Chia sẻ ứng dụng',
                                style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Đăng xuất',
                                style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w300, color: Color(0xff222222)),
                              ),
                            ],
                          ),
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
    );
  }
}
