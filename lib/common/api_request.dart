import 'package:dio/dio.dart';
// import 'api_constant.dart';
import 'dio_client.dart';

class ApiRequest {
  late Dio _dio;
  ApiRequest(){
    _dio = DioClient.instance.dio;
  }
  // Future getProducts() {
  //   return _dio.get(ApiConstant.LIST_PRODUCT_URL);
  // }
}