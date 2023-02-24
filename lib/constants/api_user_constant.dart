import 'package:dio/dio.dart';
import 'package:mikltea/models/api_user_model.dart';

class UserConstant {
  static const String BASE_URL = "https://api.escuelajs.co/api/v1/users/1";
  static Future<UserModel> LoginUser(String email, String password) async {
    try {
      Response response = await Dio().post(BASE_URL, data: {
          'email': email,
          'password': password
        },
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}