import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        leading: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon( Icons.arrow_back_ios_new,color: Colors.black,),
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
                  padding: const EdgeInsets.only(bottom: 55),
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
                      labelText: 'Họ và tên(*)',
                      labelStyle: TextStyle(
                        color: Color(0xFF727272),
                      ),
                      hintText: 'Your Name',
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
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300, color: Color(0xFF727272)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F5FA),
                      labelText: 'Số điện thoại(*)',
                      labelStyle: TextStyle(
                        color: Color(0xFF727272),
                      ),
                      hintText: 'Your Phone',
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
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300, color: Color(0xFF727272)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF5F5FA),
                      labelText: 'Email của bạn',
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
                      labelText: 'Mật khẩu',
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
                      labelText: 'Nhập lại mật khẩu',
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GestureDetector(
                    onTap:(){
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
              ],
            ),
          ),
        ),
      ),

    );
  }
}
