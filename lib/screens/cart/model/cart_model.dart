class CartModel {
  CartModel({
    this.id,
    this.id_product,
    this.title,
    this.photo,
    this.qty,
    this.price,
    });

  CartModel.fromJson(dynamic json) {
    id = json['id'];
    id_product = json['id_product'];
    title = json['title'];
    photo = json['photo'];
    qty = json['qty'];
    price = json['price'];
  }
  num? id;
  String? id_product;
  String? title;
  String? photo;
  num? qty;
  num? price;
  CartModel copyWith({  num? id,
    String? id_product,
    String? title,
    String? photo,
    num? qty,
    num? price,
  }) => CartModel(  id: id ?? this.id,
    id_product: id_product ?? this.id_product,
    title: title ?? this.title,
    photo: photo ?? this.photo,
    qty: qty ?? this.qty,
    price: price ?? this.price,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['id_product'] = id_product;
    map['title'] = title;
    map['photo'] = photo;
    map['qty'] = qty;
    map['price'] = price;
    return map;
  }
}