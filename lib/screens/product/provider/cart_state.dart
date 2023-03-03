part of 'cart_provider.dart';

enum CartStatus {Loading, Loaded , Success, Failure}
class CartState extends Equatable {
  final CartStatus status;
  final List<CartModel> listCarts;
  final int qty;
  final String? message;

  const CartState({
    this.status = CartStatus.Loading,
    this.listCarts = const [],
    this.qty = 1,
    this.message,
  });

  CartState copyWith({
    CartStatus? status,
    List<CartModel>? listCarts,
    int? qty,
    String? message,
  }) {
    return CartState(
      status: status ?? this.status,
      listCarts: listCarts ?? this.listCarts,
      qty: qty ?? this.qty,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [ status, listCarts];
}