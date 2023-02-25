import 'api_request.dart';

abstract class BaseRepository {
  late ApiRequest apiRequest;

  void updateRequest(ApiRequest apiRequest) {
    this.apiRequest = apiRequest;
  }
}
class ProductRepository extends BaseRepository{
  Future getListProducts() {
    return apiRequest.getProducts();
  }
}