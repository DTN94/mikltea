import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TaiKhoan extends StatelessWidget {
  const TaiKhoan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(
        children: [
          SizedBox(
            child: Image.asset('assets/images/tk_top.png'),
          )
        ],
      ),
    );
  }
}
