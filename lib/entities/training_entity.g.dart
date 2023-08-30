// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrainingEntityAdapter extends TypeAdapter<TrainingEntity> {
  @override
  final int typeId = 6;

  @override
  TrainingEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainingEntity(
      id: fields[0] as int,
      createOn: fields[1] as String,
      updateOn: fields[2] as String,
      name: fields[3] as String,
      speaker: fields[4] as String,
      description: fields[5] as String,
      link: fields[6] as String,
      price: fields[7] as double,
      duration: fields[8] as String,
      audience: fields[9] as String,
      imageUrl: (fields[10] as List).cast<ImageUrl>(),
      email: fields[11] as String,
      program: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrainingEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createOn)
      ..writeByte(2)
      ..write(obj.updateOn)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.speaker)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.link)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.duration)
      ..writeByte(9)
      ..write(obj.audience)
      ..writeByte(10)
      ..write(obj.imageUrl)
      ..writeByte(11)
      ..write(obj.email)
      ..writeByte(12)
      ..write(obj.program);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrainingEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageUrlAdapter extends TypeAdapter<ImageUrl> {
  @override
  final int typeId = 7;

  @override
  ImageUrl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageUrl(
      id: fields[0] as int,
      createOn: fields[1] as DateTime,
      updateOn: fields[2] as DateTime,
      path: fields[3] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, ImageUrl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createOn)
      ..writeByte(2)
      ..write(obj.updateOn)
      ..writeByte(3)
      ..write(obj.path);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageUrlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
