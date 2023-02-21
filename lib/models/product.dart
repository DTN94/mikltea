// ignore_for_file: non_constant_identifier_names

class Product {
  final int id;
  final int id_list;
  final String name;
  final String photo;
  final String size;
  final double price;
  final int boxcolor;

  Product({
    required this.id,
    required this.id_list,
    required this.photo,
    required this.name,
    required this.size,
    required this.price,
    required this.boxcolor,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        id_list: json['id_list'],
        name: json['name'],
        photo: json['photo'],
        size: json['size'],
        price: json['price'],
        boxcolor: json['boxcolor'],
      );

  Map<String, dynamic> toJson() => {'id': id, 'id_list': id_list, 'name': name, 'photo': photo, 'size': size, 'price': price, 'boxcolor': boxcolor};

  static List<Product> getProducts() {
    List<Product> products = [
      Product(id: 1, id_list: 1, photo: 'product1.png', name: 'Trân Châu Đường Đen', size: 'M', price: 49000, boxcolor: 0xffDEF4FF),
      Product(id: 2, id_list: 1, photo: 'product2.png', name: 'Sữa Chua Nho Lulu', size: 'M', price: 49000, boxcolor: 0xffEFE3FF),
      Product(id: 3, id_list: 1, photo: 'product2.png', name: 'Trà Xoài Kem Cheese', size: 'M', price: 49000, boxcolor: 0xffEFEAE5),
      Product(id: 4, id_list: 1, photo: 'product3.png', name: 'Trà Xoài Kem Cheese', size: 'M', price: 49000, boxcolor: 0xffEFEAE5),
      Product(id: 5, id_list: 1, photo: 'product4.png', name: 'Trà Xoài Kem Cheese', size: 'M', price: 49000, boxcolor: 0xffDEF4FF),
    ];

    return products;
  }

  static List<Product> getByList(int id_list) {
    List<Product> products = [];
    if (id_list == 1) {
      products = [
        Product(id: 1, id_list: 1, photo: 'product1.png', name: 'Trân Châu Đường Đen', size: 'M', price: 49000, boxcolor: 0xffDEF4FF),
        Product(id: 2, id_list: 1, photo: 'product2.png', name: 'Sữa Chua Nho Lulu', size: 'M', price: 49000, boxcolor: 0xffEFE3FF),
        Product(id: 3, id_list: 1, photo: 'product2.png', name: 'Trà Xoài Kem Cheese', size: 'M', price: 49000, boxcolor: 0xffEFEAE5),
      ];
    } else if (id_list == 2) {
      products = [
        Product(id: 1, id_list: 2, photo: 'product3.png', name: 'Trân Châu Đường Đen', size: 'M', price: 49000, boxcolor: 0xffDEF4FF),
        Product(id: 2, id_list: 2, photo: 'product4.png', name: 'Sữa Chua Nho Lulu', size: 'M', price: 49000, boxcolor: 0xffEFE3FF),
        Product(id: 3, id_list: 2, photo: 'product3.png', name: 'Trà Xoài Kem Cheese', size: 'M', price: 49000, boxcolor: 0xffEFEAE5),
      ];
    }

    return products;
  }
}
