import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];
  List<Cart> get cartItems => _carts;

  void addCart(Cart cart1) async {
    var carts = await Hive.openBox<Cart>('carts');
    final cart = Cart(id: cart1.id, product: cart1.product, quantity: cart1.quantity, price: cart1.product.regularPrice);
    carts.add(cart);
    notifyListeners();
  }
}
