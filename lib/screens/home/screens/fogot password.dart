import 'package:flutter/material.dart';
import 'package:mikltea/screens/home/screens/create%20new%20password.dart';
import 'package:pinput/pinput.dart';

class Fogot extends StatefulWidget {
  const Fogot({Key? key}) : super(key: key);

  @override
  State<Fogot> createState() => _FogotState();
}

class _FogotState extends State<Fogot> {
  Widget buildPinPut() {

    final defaultPinTheme = PinTheme(
      width: 70,
      height: 60,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w400),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),

    );
    return Pinput(
      onCompleted: (pin) => print(pin),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 170,
        leading: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon( Icons.arrow_back_ios_new,color: Colors.black,),
            label: const Text('Quên mật khẩu',style: TextStyle(color: Color(0xFF222222),fontWeight: FontWeight.w500,fontSize: 18,)),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
            )
        ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text('Nhập mã opt được gửi sms qua số ******321',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300,),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: buildPinPut(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gửi lại',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Color(0Xff222222)),),
                    Text('(00:50s)',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Color(0XffFB9116)),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22,top: 34),
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
          )
      ),

    );
  }
}


