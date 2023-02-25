import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mikltea/model/api_produt_model.dart';

class apiProduct {
  static Future<List<ApiProduct>>
  getProduct() async{
    try {
      final response = await Dio().get('https://api.escuelajs.co/api/v1/products');
      var getData = (response.data as List).map((i) => ApiProduct.fromJson(i)).toList();
      return getData;
    }catch(e){
      throw Exception("loi");
    }
  }
}
