import 'package:hive/hive.dart';

part 'cart_model_hive.g.dart';

@HiveType(typeId: 1)
class CartModelHive {
  @HiveField(0)
  final String id_product;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String photo;

  @HiveField(3)
  final num qty;

  @HiveField(4)
  final num price;

  CartModelHive({required this.id_product, required this.title, required this.photo , required this.qty, required this.price});
}