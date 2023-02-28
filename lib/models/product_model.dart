class ProductModel {
  int? id;
  String? photo;
  String? name;
  int? regularPrice;
  int? salePrice;
  int? discount;
  String? desc;
  String? content;
  String? idList;
  List<String>? gallery;
  Category? category;

  ProductModel(
      {this.id,
        this.photo,
        this.name,
        this.regularPrice,
        this.salePrice,
        this.discount,
        this.desc,
        this.content,
        this.idList,
        this.gallery,
        this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    discount = json['discount'];
    desc = json['desc'];
    content = json['content'];
    idList = json['id_list'];
    gallery = json['gallery'].cast<String>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['discount'] = this.discount;
    data['desc'] = this.desc;
    data['content'] = this.content;
    data['id_list'] = this.idList;
    data['gallery'] = this.gallery;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  String? namevi;

  Category({this.id, this.namevi});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namevi = json['namevi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namevi'] = this.namevi;
    return data;
  }
}
