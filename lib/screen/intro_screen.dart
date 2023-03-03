import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/image/intro_bg.jpg', fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const Text(
                      'The Alley Tea',
                      style: TextStyle(fontSize: 40, color: Color(0xff222222)),
                    ),
                    const Text(
                      'Tìm thức uống yêu thích của bạn và chúng tôi sẵn sàng cung cấp đến nhà của bạn',
                      style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w300, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 145,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/home');
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              backgroundColor: const Color(0xffFB9116),
                            ),
                            child: const Text('Bắt Đầu', style: TextStyle(fontFamily: 'Oswald', fontSize: 14, color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          width: 145,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
