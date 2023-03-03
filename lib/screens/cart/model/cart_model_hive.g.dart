// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelHiveAdapter extends TypeAdapter<CartModelHive> {
  @override
  final int typeId = 1;

  @override
  CartModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModelHive(
      id_product: fields[0] as String,
      title: fields[1] as String,
      photo: fields[2] as String,
      qty: fields[3] as num,
      price: fields[4] as num,
    );
  }

  @override
  void write(BinaryWriter writer, CartModelHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id_product)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.qty)
      ..writeByte(4)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
