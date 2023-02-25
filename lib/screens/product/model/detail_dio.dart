import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/api_constant.dart';
import 'product_model.dart';

final futureDetailProductProvider = FutureProvider.autoDispose.family<ProductModel , String>((ref , id) async {
  final _dio = Dio();
  final Response reponse = await _dio.get(ApiConstant.LIST_PRODUCT_URL+'/'+id);
  return ProductModel.fromJson(reponse.data);
});