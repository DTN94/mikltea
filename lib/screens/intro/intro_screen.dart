import 'package:flutter/material.dart';
import 'package:mikltea/screens/account/login_screen.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/intro_bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'The Alley Tea',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 40, color: Color(0xff222222), fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tìm thức uống yêu thích của bạn và chúng tôi sẵn sàng cung cấp đến nhà của bạn',
                      style: TextStyle(fontFamily: 'Oswald', fontSize: 13, color: Color(0xff222222), fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 145,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: const Color(0xffFB9116),
                          ),
                          child: const Text('Bắt Đầu', style: TextStyle(fontFamily: 'Oswald', fontSize: 14, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 145,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => const Login(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text('Đăng nhập', style: TextStyle(fontFamily: 'Oswald', fontSize: 14, color: Color(0xffFB9116))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
