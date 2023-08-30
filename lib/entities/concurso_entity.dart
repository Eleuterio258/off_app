import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'concurso_entity.g.dart';

@HiveType(typeId: 1)
class ConcursoEntity extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String createOn;

  @HiveField(2)
  late String updateOn;

  @HiveField(3)
  late String finalDate;

  @HiveField(4)
  late Category category;

  @HiveField(5)
  late String description;

  @HiveField(6)
  late   Uint8List? attachment;

  @HiveField(7)
  late String empresa;

  @HiveField(8)
  late String termoReferencia;

  @HiveField(9)
  late bool notificado;

  @HiveField(10)
  late String name;

  @HiveField(11)
  late double price;

  @HiveField(12)
  late bool estado;

  ConcursoEntity({
    required this.id,
    required this.createOn,
    required this.updateOn,
    required this.finalDate,
    required this.category,
    required this.description,
    required this.attachment,
    required this.empresa,
    required this.termoReferencia,
    required this.notificado,
    required this.name,
    required this.price,
    required this.estado,
  });

  factory ConcursoEntity.fromJson(Map<String, dynamic> json) {
    return ConcursoEntity(
      id: json['id'],
      createOn: json['createOn'],
      updateOn: json['updateOn'],
      finalDate: json['finalDate'],
      category: Category.fromJson(json['category']),
      description: json['description'],
      attachment: json['attachment'],
      empresa: json['empresa'],
      termoReferencia: json['termoReferencia'],
      notificado: json['notificado'],
      name: json['name'],
      price: json['price'],
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createOn': createOn,
      'updateOn': updateOn,
      'finalDate': finalDate,
      'category': category.toJson(),
      'description': description,
      'attachment': attachment,
      'empresa': empresa,
      'termoReferencia': termoReferencia,
      'notificado': notificado,
      'name': name,
      'price': price,
      'estado': estado,
    };
  }
}

@HiveType(typeId: 2)
class Category {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String description;

  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
