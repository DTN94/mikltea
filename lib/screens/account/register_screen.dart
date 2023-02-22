import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password2 = TextEditingController();

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
                'Đăng ký tài khoản',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff222222), fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: _fullname,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    fillColor: const Color(0xffF5F5FA),
                    labelText: 'Họ và tên (*)',
                    hintText: 'Nhập họ và tên',
                    labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                    hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _phone,
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    fillColor: const Color(0xffF5F5FA),
                    labelText: 'Số điện thoại (*)',
                    hintText: 'Nhập số điện thoại',
                    labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                    hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                  ),
                ),
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
                    labelText: 'Email của bạn',
                    hintText: 'Nhập email của bạn',
                    labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                    hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
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
                    labelText: 'Mật khẩu',
                    hintText: 'Nhập mật khẩu',
                    labelStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff727272), fontWeight: FontWeight.w300),
                    hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                    hintStyle: const TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color.fromARGB(174, 114, 114, 114), fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: const Color(0xffFB9116),
                  ),
                  child: const Text('Đăng ký', style: TextStyle(fontFamily: 'Oswald', fontSize: 16, color: Colors.white)),
                ),
              ),
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
