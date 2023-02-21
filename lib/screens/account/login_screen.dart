import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mikltea/screens/index.dart';

import 'forget_screen.dart';
import 'register_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Welcome The Alley Tea',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 26, color: Color(0xff0E0E0E), fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Đăng nhập tài khoản của bạn',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222), fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    fillColor: const Color(0xffF5F5FA),
                    labelText: 'Email hoặc số điện thoại',
                    hintText: 'Nhập Email hoặc số điện thoại',
                    labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                    hintStyle:
                        const TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                    labelText: 'Password',
                    hintText: 'Nhập Password',
                    labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                    hintStyle:
                        const TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ForgetPassword(),
                      ),
                    );
                  },
                  child: const Text(
                    'Quên mật khẩu?',
                    style: TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222), fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Index(),
                      ),
                      (Route<dynamic> route) => false,
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
              const SizedBox(height: 30),
              const Text(
                'Or',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff9A9A9A), fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: const Text('Facebook'),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {},
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      width: 70,
                      height: 50,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(15.0), border: Border.all(color: const Color(0xffEBEBEB), width: 1)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SvgPicture.asset(
                          'assets/images/facebook.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: const Text('Gmail'),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {},
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      width: 70,
                      height: 50,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(15.0), border: Border.all(color: const Color(0xffEBEBEB), width: 1)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SvgPicture.asset(
                          'assets/images/gmail.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bạn chưa có tài khoản?',
                    style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xff9A9A9A), fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Register(),
                        ),
                      );
                    },
                    child: const Text(
                      'Đăng ký ngay',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Color(0xffFB9116), fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
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
