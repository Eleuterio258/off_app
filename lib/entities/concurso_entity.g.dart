// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concurso_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConcursoEntityAdapter extends TypeAdapter<ConcursoEntity> {
  @override
  final int typeId = 1;

  @override
  ConcursoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConcursoEntity(
      id: fields[0] as int,
      createOn: fields[1] as String,
      updateOn: fields[2] as String,
      finalDate: fields[3] as String,
      category: fields[4] as Category,
      description: fields[5] as String,
      attachment: fields[6] as Uint8List?,
      empresa: fields[7] as String,
      termoReferencia: fields[8] as String,
      notificado: fields[9] as bool,
      name: fields[10] as String,
      price: fields[11] as double,
      estado: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ConcursoEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createOn)
      ..writeByte(2)
      ..write(obj.updateOn)
      ..writeByte(3)
      ..write(obj.finalDate)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.attachment)
      ..writeByte(7)
      ..write(obj.empresa)
      ..writeByte(8)
      ..write(obj.termoReferencia)
      ..writeByte(9)
      ..write(obj.notificado)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.price)
      ..writeByte(12)
      ..write(obj.estado);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConcursoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
