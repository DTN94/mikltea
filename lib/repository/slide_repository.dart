import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

final slideRepositoryProvider = Provider<SlideRepository>((ref) => SlideRepository());

final dio = Dio();
// ignore: non_constant_identifier_names
String BASE_URL = "http://demo32.ninavietnam.com.vn/API/ninasource8v5/api/slide_api.php";

class SlideRepository {
  Future<List<String>> getSlides() async {
    final response = await dio.get(BASE_URL, queryParameters: {'action': 'list'});

    if (response.statusCode == 200) {
      return Future.delayed(const Duration(milliseconds: 300), () {
        return (json.decode(response.data) as List<dynamic>).cast<String>();
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
