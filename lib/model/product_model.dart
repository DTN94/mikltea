class ProductModel {
  late int id;
  late String name;
  late String photo;
  late String desc;
  late String content;
  late Category category;
  late List<String> gallery;
  late String code;
  late int regularPrice;
  late int salePrice;
  late List<Sizes> sizes;

  ProductModel({
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
    required this.sizes,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    desc = json['desc'];
    content = json['content'];
    category = (json['category'] != null ? Category.fromJson(json['category']) : null)!;
    gallery = json['gallery'].cast<String>();
    code = json['code'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    sizes = <Sizes>[];
    if (json['sizes'] != null) {
      json['sizes'].forEach((v) {
        sizes.add(Sizes.fromJson(v));
      });
    }
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
    data['sizes'] = sizes.map((v) => v.toJson()).toList();
    return data;
  }
}

class Category {
  late int id;
  late String name;
  late String photo;
  late String desc;
  late String content;

  Category({
    required this.id,
    required this.name,
    required this.photo,
    required this.desc,
    required this.content,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    desc = json['desc'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['desc'] = desc;
    data['content'] = content;
    return data;
  }
}

class Sizes {
  late int id;
  late String name;

  Sizes({
    required this.id,
    required this.name,
  });

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
