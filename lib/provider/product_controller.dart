import 'package:milktea/model/product_model.dart';
import 'package:milktea/provider/category_controller.dart';
import 'package:milktea/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_state.g.dart';

@riverpod
Future<List<ProductModel>> allProducts(AllProductsRef ref) async {
  final ProductRepository productRepository = ref.watch(productRepositoryProvider);
  var allProducts = productRepository.getProducts();

  final selectedCategory = ref.watch(selectedCategoryProvider);
  if (selectedCategory != null) {
    allProducts = productRepository.getProductsByCategory(selectedCategory.id);
  }

  return allProducts;
}

@riverpod
Future<ProductModel> getProduct(GetProductRef ref, int id) async {
  final ProductRepository productRepository = ref.watch(productRepositoryProvider);

  return productRepository.getProduct(id);
}
