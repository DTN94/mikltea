part of 'search_provider.dart';

enum SearchStatus {Loading, Loaded, Success, Failure}
class SearchState extends Equatable {
  final String keyword;
  final SearchStatus status;
  final List<ProductModel> listProducts;
  final String? message;

  const SearchState({
    this.keyword = '',
    this.listProducts = const [],
    this.status = SearchStatus.Loading,
    this.message,
  });

  SearchState copyWith({
    String? keyword,
    SearchStatus? status,
    List<ProductModel>? listProducts,
    String? message,
  }) {
    return SearchState(
      keyword: keyword ?? this.keyword,
      status: status ?? this.status,
      listProducts: listProducts ?? this.listProducts,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [ keyword, status, listProducts];
}
