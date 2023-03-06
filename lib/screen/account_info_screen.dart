import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AccountInfoScreen extends ConsumerWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Thông tin tài khoản'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icon/arrow_left.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xffFEDEB9)),
          child: Column(
            children: [
              const SizedBox(height: 170),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: 50,
                    right: 50,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Chỉnh sửa',
                              style: TextStyle(
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300,
                                color: Color(0xff222222),
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: TextField(
                                enableInteractiveSelection: false,
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  hintText: 'Nguyen Huu Tho',
                                  hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: Color(0xffEAEAEA)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: SizedBox(
                                    height: 50,
                                    child: TextField(
                                      enableInteractiveSelection: false,
                                      onTap: () {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                          child: Image.asset(
                                            'assets/image/flag_vi.png',
                                            width: 26,
                                            height: 20,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        hintText: '+84',
                                        hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(width: 1, color: Color(0xffEAEAEA)),
                                          borderRadius: BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  flex: 7,
                                  child: SizedBox(
                                    height: 50,
                                    child: TextField(
                                      enableInteractiveSelection: false,
                                      onTap: () {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        hintText: '987654321',
                                        hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(width: 1, color: Color(0xffEAEAEA)),
                                          borderRadius: BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                enableInteractiveSelection: false,
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                                    child: Image.asset(
                                      'assets/image/check.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ), //Icon at the end
                                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  hintText: 'huuthonina@gmail.com',
                                  hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: Color(0xffEAEAEA)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                enableInteractiveSelection: false,
                                onTap: () {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  hintText: 'Đường Điện Biên Phủ, Phường 22, Q. Bình Thạnh, Tp. Hồ Chí Minh',
                                  hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: Color(0xffEAEAEA)),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const SizedBox(
                              height: 50,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Liên kết tài khoản',
                                  style: TextStyle(fontSize: 16, fontFamily: 'Oswald', fontWeight: FontWeight.w600, color: Color(0xff222222)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Image.asset('assets/image/google.png'),
                                const SizedBox(width: 15),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Google',
                                    style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Color(0xff2B2B2B)),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 40,
                                  height: 20,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Switch(
                                      value: true,
                                      activeColor: Colors.green,
                                      onChanged: (bool value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(height: 0.5),
                            ),
                            Row(
                              children: [
                                Image.asset('assets/image/facebook.png'),
                                const SizedBox(width: 15),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Facebook',
                                    style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Color(0xff2B2B2B)),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: 40,
                                  height: 20,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Switch(
                                      value: true,
                                      activeColor: Colors.green,
                                      onChanged: (bool value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
