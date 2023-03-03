import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:milktea/model/cart_model.dart';

final cartProvider = ChangeNotifierProvider((ref) => CartRepository());

class CartRepository extends ChangeNotifier {
  List<CartModel> carts = Hive.box<CartModel>('CART_BOX').values.toList();

  var box = Hive.box<CartModel>('CART_BOX');

  void reload() {
    carts = Hive.box<CartModel>('CART_BOX').values.toList();
  }

  void addToCart(CartModel cart) {
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

  void removeFromCart(CartModel cart) {
    int existedId = carts.indexWhere((e) => e.productId == cart.productId);
    if (existedId > -1) {
      if (carts[existedId].quantity > 1) {
        carts[existedId].quantity -= 1;

        box.putAt(existedId, carts[existedId]);
      } else {
        box.deleteAt(existedId);
      }
    }

    reload();
    notifyListeners();
  }

  int getTotal() {
    int total = 0;
    for (var e in carts) {
      total += (e.price * e.quantity);
    }

    return total;
  }
}
