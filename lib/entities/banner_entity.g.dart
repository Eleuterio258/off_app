// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BannerEntityAdapter extends TypeAdapter<BannerEntity> {
  @override
  final int typeId = 0;

  @override
  BannerEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannerEntity(
      id: fields[0] as int,
      createOn: fields[1] as String,
      updateOn: fields[2] as String,
      visivel: fields[3] as bool,
      empresa: fields[4] as String,
      localDaPublicidade: fields[5] as String,
      foto1: fields[6] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, BannerEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createOn)
      ..writeByte(2)
      ..write(obj.updateOn)
      ..writeByte(3)
      ..write(obj.visivel)
      ..writeByte(4)
      ..write(obj.empresa)
      ..writeByte(5)
      ..write(obj.localDaPublicidade)
      ..writeByte(6)
      ..write(obj.foto1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
