import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikltea/models/category.dart';
part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String photo;
  @HiveField(3)
  late String desc;
  @HiveField(4)
  late String content;
  @HiveField(5)
  late Category category;
  @HiveField(6)
  late List<String> gallery;
  @HiveField(7)
  late String code;
  @HiveField(8)
  late int regularPrice;
  @HiveField(9)
  late int salePrice;

  Product({
    required this.id,
    required this.name,
    required this.photo,
    required this.desc,
    required this.content,
    required this.category,
    required this.gallery,
    required this.code,
    required this.regularPrice,
    required this.salePrice,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    photo = json['photo'] ?? '';
    desc = json['desc'] ?? '';
    content = json['content'] ?? '';
    category = (json['category'] != null ? Category.fromJson(json['category']) : null)!;
    gallery = json['gallery'].cast<String>();
    code = json['code'] ?? '';
    regularPrice = json['regular_price'] ?? 0;
    salePrice = json['sale_price'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['desc'] = desc;
    data['content'] = content;
    data['category'] = category.toJson();
    data['gallery'] = gallery;
    data['code'] = code;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    return data;
  }
}
