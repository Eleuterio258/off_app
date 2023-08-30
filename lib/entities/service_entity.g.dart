// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceEntityAdapter extends TypeAdapter<ServiceEntity> {
  @override
  final int typeId = 3;

  @override
  ServiceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceEntity(
      id: fields[0] as int,
      createOn: fields[1] as DateTime,
      updateOn: fields[2] as DateTime,
      description: fields[3] as String,
      price: fields[4] as double,
      name: fields[5] as String,
      isPaid: fields[6] as bool,
      owner: fields[7] as String,
      nrView: fields[8] as int,
      pdfPortfolio: fields[9] as String,
      rates: fields[10] as Rates,
      imageUrl: (fields[11] as List).cast<ImageUrl>(),
    );
  }

  @override
  void write(BinaryWriter writer, ServiceEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createOn)
      ..writeByte(2)
      ..write(obj.updateOn)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.isPaid)
      ..writeByte(7)
      ..write(obj.owner)
      ..writeByte(8)
      ..write(obj.nrView)
      ..writeByte(9)
      ..write(obj.pdfPortfolio)
      ..writeByte(10)
      ..write(obj.rates)
      ..writeByte(11)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RatesAdapter extends TypeAdapter<Rates> {
  @override
  final int typeId = 4;

  @override
  Rates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rates(
      id: fields[0] as int,
      createOn: fields[1] as DateTime,
      updateOn: fields[2] as DateTime,
      priraEstrela: fields[3] as int,
      segEstrela: fields[4] as int,
      terEstrela: fields[5] as int,
      quartaEstrela: fields[6] as int,
      quintaEstrela: fields[7] as int,
      total: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Rates obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createOn)
      ..writeByte(2)
      ..write(obj.updateOn)
      ..writeByte(3)
      ..write(obj.priraEstrela)
      ..writeByte(4)
      ..write(obj.segEstrela)
      ..writeByte(5)
      ..write(obj.terEstrela)
      ..writeByte(6)
      ..write(obj.quartaEstrela)
      ..writeByte(7)
      ..write(obj.quintaEstrela)
      ..writeByte(8)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageUrlAdapter extends TypeAdapter<ImageUrl> {
  @override
  final int typeId = 5;

  @override
  ImageUrl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageUrl(
      id: fields[0] as int,
      createOn: fields[1] as String,
      updateOn: fields[2] as String,
      path: fields[3] as Uint8List?,
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
