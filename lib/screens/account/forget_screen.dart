import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'change_password_screen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _pincode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  String currentText = "";

  late Timer _timer;
  int _start = 10;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (Timer timer) {
        if (_start <= 0) {
          if (mounted) {
            setState(() {
              timer.cancel();
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _start--;
            });
          }
        }
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 100),
              const Text(
                'Nhập mã opt được gửi sms qua số ******321',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 18, color: Color(0xff222222), fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 2) {
                      return "Fill code";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 70,
                    activeFillColor: const Color(0xffF5F5FA),
                    inactiveFillColor: const Color(0xffF5F5FA),
                    selectedFillColor: const Color(0xffF5F5FA),
                    borderWidth: 0,
                    inactiveColor: Colors.transparent,
                    activeColor: Colors.transparent,
                  ),
                  cursorColor: Colors.black,
                  enableActiveFill: true,
                  controller: _pincode,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Sai pin code" : "",
                  style: const TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Gửi lại ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  (_start == 0)
                      ? TextButton(
                          onPressed: () => {
                            setState(() {
                              _start = 10;
                            })
                          },
                          child: const Text(
                            "RESEND",
                            style: TextStyle(color: Color(0xffFB9116), fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      : Text(
                          '00:${_start}s',
                          style: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xffFB9116), fontWeight: FontWeight.w300),
                        ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFB9116),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText != "1234") {
                        setState(() => hasError = true);
                      } else {
                        setState(
                          () {
                            snackBar("OTP Verified!!");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => const ChangePassword(),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Center(
                        child: Text(
                      "Xác thực",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
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
      title: const Text('Quên mật khẩu'),
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
