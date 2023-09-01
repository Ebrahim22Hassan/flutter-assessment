// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactEntityAdapter extends TypeAdapter<ContactEntity> {
  @override
  final int typeId = 0;

  @override
  ContactEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactEntity(
      id: fields[0] as int?,
      email: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String?,
      avatar: fields[4] as String?,
      isFavorite: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ContactEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.avatar)
      ..writeByte(5)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
