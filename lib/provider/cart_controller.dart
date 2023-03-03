import 'package:milktea/model/cart_model.dart';
import 'package:milktea/repository/cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_controller.g.dart';

@riverpod
Future<List<CartModel>> allCarts(AllCartsRef ref) async {
  final CartRepository cartRepository = ref.watch(cartRepositoryProvider);
  return cartRepository.carts;
}

@riverpod
Future<void> addToCart(AddToCartRef ref, CartModel cart) async {
  final CartRepository cartRepository = ref.watch(cartRepositoryProvider);
  return cartRepository.addToCart(cart);
}

@riverpod
Future<void> deleteFromCart(DeleteFromCartRef ref, CartModel cart) async {
  final CartRepository cartRepository = ref.watch(cartRepositoryProvider);
  return cartRepository.removeFromCart(cart);
}
