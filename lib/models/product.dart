class Product {
  final int id;
  final String name;
  final String photo;
  final String size;
  final double price;
  final int value;

  Product({required this.id, required this.photo, required this.name, required this.size, required this.price, required this.value});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        size: json['size'],
        price: json['price'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'photo': photo, 'size': size, 'price': price, 'value': value};
}
