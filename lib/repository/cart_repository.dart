import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:milktea/model/cart_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) => CartRepository();

class CartRepository extends ChangeNotifier {
  List<CartModel> carts = Hive.box<CartModel>('CART_BOX').values.toList();

  var box = Hive.box<CartModel>('CART_BOX');

  void reload() {
    carts = Hive.box<CartModel>('CART_BOX').values.toList();
  }

  Future<void> addToCart(CartModel cart) async {
    int existedId = carts.indexWhere((e) => e.productId == cart.productId);
    if (existedId > -1) {
      carts[existedId].quantity += 1;

      box.putAt(existedId, carts[existedId]);
    } else {
      box.add(cart);
    }
    reload();
    notifyListeners();
  }

  Future<void> removeFromCart(CartModel cart) async {
    await box.clear();
  }
}
