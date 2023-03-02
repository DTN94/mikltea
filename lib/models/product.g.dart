// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as int,
      name: fields[1] as String,
      photo: fields[2] as String,
      desc: fields[3] as String,
      content: fields[4] as String,
      category: fields[5] as Category,
      gallery: (fields[6] as List).cast<String>(),
      code: fields[7] as String,
      regularPrice: fields[8] as int,
      salePrice: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.gallery)
      ..writeByte(7)
      ..write(obj.code)
      ..writeByte(8)
      ..write(obj.regularPrice)
      ..writeByte(9)
      ..write(obj.salePrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
