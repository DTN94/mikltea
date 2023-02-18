import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(500.0),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 4.0, spreadRadius: 0.1)
          ]
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tìm kiếm',
          suffixIcon: Icon(Icons.search,color: Colors.black,size: 25,),
          contentPadding: EdgeInsets.only(left: 20,right: 10,top: 10),
        ),
      ),
    );
  }
}
