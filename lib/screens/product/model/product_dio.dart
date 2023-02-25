import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/api_constant.dart';
import 'product_model.dart';

final futureListProductProvider = FutureProvider.autoDispose<List<ProductModel>?>((ref) async {
  final List<ProductModel> list = [];
  final _dio = Dio();
  final Response reponse = await _dio.get(ApiConstant.LIST_PRODUCT_URL);
  if (reponse.statusCode == 200) {
    final jsonReponse = reponse.data;
    (jsonReponse as List).forEach((json) {
      list.add(ProductModel.fromJson(json));
    });
  }
  return list;
});
