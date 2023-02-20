class Product {
  final int id;
  final String name;
  final String photo;
  final String size;
  final double price;
  final int quantity;

  Product(
      {required this.id,
      required this.photo,
      required this.name,
      required this.size,
      required this.price,
      required this.quantity});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
        size: json['size'],
        price: json['price'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photo': photo,
        'size': size,
        'price': price,
        'quantity': quantity
      };
}
