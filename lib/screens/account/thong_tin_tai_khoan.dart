import 'package:flutter/material.dart';

class InfoTaiKhoan extends StatefulWidget {
  const InfoTaiKhoan({super.key});

  @override
  State<InfoTaiKhoan> createState() => _InfoTaiKhoanState();
}

class _InfoTaiKhoanState extends State<InfoTaiKhoan> {
  bool light_google = false;
  bool light_fb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin tài khoản'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xffFEDEB9)),
          child: Column(
            children: [
              const SizedBox(height: 100),
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
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/avatar.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
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
                        const SizedBox(height: 75),
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
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
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
                                            'assets/images/flag_vi.png',
                                            width: 26,
                                            height: 20,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        hintText: '+84',
                                        hintStyle: const TextStyle(
                                            fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
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
                                        hintStyle: const TextStyle(
                                            fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
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
                                      'assets/images/check.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ), //Icon at the end
                                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  hintText: 'huuthonina@gmail.com',
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
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
                                  hintStyle:
                                      const TextStyle(fontFamily: 'Oswald', fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xff222222)),
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
                                Image.asset('assets/images/google.png'),
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
                                      value: light_google,
                                      activeColor: Colors.green,
                                      onChanged: (bool value) {
                                        setState(() {
                                          light_google = value;
                                        });
                                      },
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
                                Image.asset('assets/images/facebook.png'),
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
                                      value: light_fb,
                                      activeColor: Colors.green,
                                      onChanged: (bool value) {
                                        setState(() {
                                          light_fb = value;
                                        });
                                      },
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
