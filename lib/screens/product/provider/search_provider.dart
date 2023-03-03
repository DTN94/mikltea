import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/api_constant.dart';
import '../model/product_model.dart';
part 'search_state.dart';

final searchProvider =
StateNotifierProvider<SearchController, SearchState>(
      (ref) => SearchController(ref),
);

class SearchController extends StateNotifier<SearchState> {
  final Ref ref;

  SearchController(this.ref) : super(const SearchState()){ }
  void onKeywordChange(String value) {
    final keyword = value.trim();
    state = state.copyWith(
      keyword: keyword,
      status: SearchStatus.Loaded,
    );
  }

  void SearchSubmit() async {
    state = state.copyWith(status: SearchStatus.Loading);
    try {
      final List<ProductModel> list = [];
      final _dio = Dio();
      final Response reponse = await _dio.get(ApiConstant.SEARCH_PRODUCT_URL+state.keyword);
      if (reponse.statusCode == 200) {
        final jsonReponse = reponse.data;
        (jsonReponse as List).forEach((json) {
          list.add(ProductModel.fromJson(json));
        });
      }
      state = state.copyWith(status: SearchStatus.Success, listProducts: list);
    } catch (e) {
      state = state.copyWith(status:  SearchStatus.Failure, message: e.toString());
    }
  }
}
