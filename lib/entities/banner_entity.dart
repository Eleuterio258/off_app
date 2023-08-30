import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'banner_entity.g.dart';

@HiveType(typeId: 0)
class BannerEntity extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String createOn;

  @HiveField(2)
  late String updateOn;

  @HiveField(3)
  late bool visivel;

  @HiveField(4)
  late String empresa;

  @HiveField(5)
  late String localDaPublicidade;

  @HiveField(6)
  late   Uint8List? foto1;

  BannerEntity({
    required this.id,
    required this.createOn,
    required this.updateOn,
    required this.visivel,
    required this.empresa,
    required this.localDaPublicidade,
    required this.foto1,
  });

  factory BannerEntity.fromJson(Map<String, dynamic> json) {
    return BannerEntity(
      id: json['id'],
      createOn:  json['createOn'],
      updateOn: json['updateOn'],
      visivel: json['visivel'],
      empresa: json['empresa'],
      localDaPublicidade: json['localDaPublicidade'],
      foto1: json['foto1'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createOn': createOn,
      'updateOn': updateOn,
      'visivel': visivel,
      'empresa': empresa,
      'localDaPublicidade': localDaPublicidade,
      'foto1': foto1,
    };
  }
}
