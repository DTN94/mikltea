import 'package:hive_flutter/hive_flutter.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late int productId;
  @HiveField(2)
  late String productName;
  @HiveField(3)
  late String productPhoto;
  @HiveField(4)
  late int quantity;
  @HiveField(5)
  late int price;

  CartModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productPhoto,
    required this.quantity,
    required this.price,
  });
}
