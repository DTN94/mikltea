import 'category.dart';

class Product {
  late final int id;
  late final String title;
  late final int price;
  late final String description;
  late final List<String> images;
  late final String creationAt;
  late final String updatedAt;
  late final Category category;

  Product({required this.id, required this.title, required this.price, required this.description, required this.images, required this.creationAt, required this.updatedAt, required this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = (json['category'] != null ? Category.fromJson(json['category']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    data['category'] = category.toJson();
    return data;
  }
}
