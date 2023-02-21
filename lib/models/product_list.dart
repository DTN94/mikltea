class LProduct {
  final int id;
  final String name;

  LProduct({required this.id, required this.name});

  factory LProduct.fromJson(Map<String, dynamic> json) => LProduct(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  static List<LProduct> getProductLists() {
    List<LProduct> lproducts = [
      LProduct(id: 1, name: 'Trà Sữa'),
      LProduct(id: 2, name: 'Trà Trái Cây'),
      LProduct(id: 3, name: 'Nước Ép'),
    ];

    return lproducts;
  }
}
