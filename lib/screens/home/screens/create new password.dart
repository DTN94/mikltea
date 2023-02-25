import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePass extends StatefulWidget {
  const CreatePass({Key? key}) : super(key: key);

  @override
  State<CreatePass> createState() => _CreatePassState();
}

class _CreatePassState extends State<CreatePass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 210,
        leading: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon( Icons.arrow_back_ios_new,color: Colors.black,),
            label: const Text('Tạo mật khẩu mới',style: TextStyle(color: Color(0xFF222222),fontWeight: FontWeight.w500,fontSize: 18,)),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset('assets/img/imgmk.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25,top: 25),
                    child: Text('Nhập mật khẩu mới của bạn',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xff9A9A9A),),textAlign: TextAlign.left,),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      check(),
                      Text('Nhớ mật khẩu',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Color(0xFF222222)),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 22,top: 20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePass()));
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
                            Text('Xác thực',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:Colors.white),
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
class check extends StatefulWidget {
  const check({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 2.0, color: Color(0xffFB9116)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        value: isChecked,
        activeColor: Color(0XFFFB9116),
        onChanged: (newBool) {
          setState(() {
            isChecked = newBool;
          });
        },
      ),

    );
  }
}




