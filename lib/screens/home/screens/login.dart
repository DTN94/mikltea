import 'package:flutter/material.dart';
import 'package:mikltea/screens/home/screens/create%20account.dart';
import 'package:mikltea/screens/home/screens/fogot%20password.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HOME.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon( Icons.arrow_back_ios_new,color: Colors.black,),
          label: const Text('Giỏ Hàng',style: TextStyle(color: Color(0xFF222222),fontWeight: FontWeight.w500,fontSize: 18,)),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text('Welcome The Alley Tea',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500,color: Color(0xFF0E0E0E)),),
                Padding(
                  padding: const EdgeInsets.only(bottom: 75),
                  child: Text('Đăng nhập tài khoản của bạn',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Color(0xFF222222)),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300, color: Color(0xFF727272)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F5FA),
                      labelText: 'Email hoặc số điện thoại',
                      labelStyle: TextStyle(
                          color: Color(0xFF727272),
                      ),
                      hintText: 'Your Email',
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300, color: Color(0xFF727272)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F5FA),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Color(0xFF727272),
                      ),
                      hintText: 'Your Password ',
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      (
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Fogot()));
                            },
                            child: const Text('Quên mật khẩu?',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Colors.black),textAlign: TextAlign.left,),
                          )
                          ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22,top: 34),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));

                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFFB9116),
                        borderRadius: BorderRadius.circular(30)
                      ),
                       child:Center(
                           child:
                           Text('Đăng nhập',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Colors.white),
                           )
                       ),
                      ),
                  ),
                ),
                Text('Or',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Color(0xFF9A9A9A)),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 50,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFEBEBEB)),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Image.asset('assets/img/face.png'),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Image.asset('assets/img/gg.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bạn chưa có tài khoản?',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Color(0xFF9A9A9A)),),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Create()));
                        },
                        child: Text('Đăng ký',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Color(0xFFFB9116)),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
