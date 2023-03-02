import 'package:hive_flutter/hive_flutter.dart';

part 'category.g.dart';

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String? content;
  @HiveField(2)
  late String? desc;
  @HiveField(3)
  late String? name;
  @HiveField(4)
  late String? photo;

  Category({
    required this.id,
    this.content,
    this.desc,
    this.name,
    this.photo,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'] ?? '';
    desc = json['desc'] ?? '';
    name = json['name'] ?? '';
    photo = json['photo'] ?? 'http://demo32.ninavietnam.com.vn/API/ninasource8v5/assets/images/noimage.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['desc'] = desc;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}
