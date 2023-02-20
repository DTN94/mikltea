import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../index.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset('assets/images/change_password.jpg', width: double.infinity, height: 319),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nhập mật khẩu mới của bạn',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff9A9A9A), fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      obscureText: true,
                      controller: _password,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        fillColor: const Color(0xffF5F5FA),
                        labelText: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu',
                        labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                        hintStyle: const TextStyle(
                            fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      obscureText: true,
                      controller: _password2,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        fillColor: const Color(0xffF5F5FA),
                        labelText: 'Nhập lại mật khẩu',
                        hintText: 'Nhập lại mật khẩu',
                        labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                        hintStyle: const TextStyle(
                            fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const Index(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: const Color(0xffFB9116),
                      ),
                      child: const Text('Đăng nhập', style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Colors.white)),
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

  AppBar appBar() {
    return AppBar(
      title: const Text('Tạo mật khẩu mới'),
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
    );
  }
}
