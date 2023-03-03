class CategoryModel {
  late int id;
  late String name;
  late String photo;
  late String desc;
  late String content;

  CategoryModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.desc,
    required this.content,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
