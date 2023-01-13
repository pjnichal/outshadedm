// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdetail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailAdapter extends TypeAdapter<UserDetail> {
  @override
  final int typeId = 0;

  @override
  UserDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetail(
      name: fields[0] as String,
      age: fields[1] as String,
      gender: fields[2] as String,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetail obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
