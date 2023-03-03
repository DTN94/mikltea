import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/api_constant.dart';
import 'categories_model.dart';
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

final futureDetailProductProvider = FutureProvider.autoDispose.family<ProductModel , String>((ref , id) async {
  final _dio = Dio();
  final Response reponse = await _dio.get(ApiConstant.LIST_PRODUCT_URL+'/'+id);
  return ProductModel.fromJson(reponse.data);
});

final futureListCategoryProvider = FutureProvider.autoDispose<List<CategoriesModel>?>((ref) async {
  final List<CategoriesModel> categories = [];
  final _dio = Dio();
  final Response reponse = await _dio.get(ApiConstant.CATEGORY_PRODUCT_URL);
  if (reponse.statusCode == 200) {
    final jsonReponse = reponse.data;
    (jsonReponse as List).forEach((json) {
      categories.add(CategoriesModel.fromJson(json));
    });
  }
  return categories;
});

final futureProductCategoryProvider = FutureProvider.autoDispose.family<List<ProductModel>? , String>((ref , id) async {
  final List<ProductModel> list = [];
  final _dio = Dio();
  final Response reponse1 = await _dio.get(ApiConstant.LIST_CATEGORY_PRODUCT_URL+id);
  if (reponse1.statusCode == 200) {
    final jsonReponse1 = reponse1.data;
    (jsonReponse1 as List).forEach((json) {
      list.add(ProductModel.fromJson(json));
    });
  }
  return list;
});
