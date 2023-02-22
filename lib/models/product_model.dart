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

  static List<Product> getProducts() {
    List<Product> products = [
      Product(
          id: 1,
          name: "Trà Xoài Kem Cheese",
          photo: "slide1.jpg",
          size: "S",
          price: 49000,
          quantity: 1),
      Product(
          id: 2,
          name: "Trà Trái Cây Nhiệt Đới",
          photo: "slide2.jpg",
          size: "M",
          price: 45000,
          quantity: 1),
      Product(
          id: 3,
          name: "Sữa Tươi Trân Chân Đường Đen",
          photo: "slide3.jpg",
          size: "L",
          price: 42000,
          quantity: 1),
      Product(
          id: 4,
          name: "Trà Vãi",
          photo: "slide1.jpg",
          size: "XL",
          price: 42000,
          quantity: 1),
    ];

    return products;
  }

  static Product? DetailProduct(int id) {
    for (var product in getProducts()) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }
}
