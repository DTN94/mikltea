import 'product.dart';
import 'package:hive/hive.dart';
part 'cart.g.dart';

@HiveType(typeId: 0)
class Cart {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late Product product;
  @HiveField(2)
  late int quantity;
  @HiveField(3)
  late int price;

  Cart({required this.id, required this.product, required this.quantity, required this.price});
}
