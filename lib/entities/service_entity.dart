import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'service_entity.g.dart';

@HiveType(typeId: 3)
class ServiceEntity extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late DateTime createOn;

  @HiveField(2)
  late DateTime updateOn;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late double price;

  @HiveField(5)
  late String name;

  @HiveField(6)
  late bool isPaid;

  @HiveField(7)
  late String owner;

  @HiveField(8)
  late int nrView;

  @HiveField(9)
  late String pdfPortfolio;

  @HiveField(10)
  late Rates rates;

  @HiveField(11)
  late List<ImageUrl> imageUrl;

  ServiceEntity({
    required this.id,
    required this.createOn,
    required this.updateOn,
    required this.description,
    required this.price,
    required this.name,
    required this.isPaid,
    required this.owner,
    required this.nrView,
    required this.pdfPortfolio,
    required this.rates,
    required this.imageUrl,
  });

  factory ServiceEntity.fromJson(Map<String, dynamic> json) {
    final ratesJson = json['rates'] as Map<String, dynamic>;
    final imageUrlJson = json['imageUrl'] as List<dynamic>;

    return ServiceEntity(
      id: json['id'],
      createOn: DateTime.parse(json['createOn']),
      updateOn: DateTime.parse(json['updateOn']),
      description: json['description'],
      price: json['price'],
      name: json['name'],
      isPaid: json['isPaid'],
      owner: json['owner'],
      nrView: json['nrView'],
      pdfPortfolio: json['pdfPortfolio'],
      rates: Rates.fromJson(ratesJson),
      imageUrl: imageUrlJson.map((e) => ImageUrl.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createOn': createOn.toIso8601String(),
      'updateOn': updateOn.toIso8601String(),
      'description': description,
      'price': price,
      'name': name,
      'isPaid': isPaid,
      'owner': owner,
      'nrView': nrView,
      'pdfPortfolio': pdfPortfolio,
      'rates': rates.toJson(),
      'imageUrl': imageUrl.map((e) => e.toJson()).toList(),
    };
  }
}

@HiveType(typeId: 4)
class Rates {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late DateTime createOn;

  @HiveField(2)
  late DateTime updateOn;

  @HiveField(3)
  late int priraEstrela;

  @HiveField(4)
  late int segEstrela;

  @HiveField(5)
  late int terEstrela;

  @HiveField(6)
  late int quartaEstrela;

  @HiveField(7)
  late int quintaEstrela;

  @HiveField(8)
  late int total;

  Rates({
    required this.id,
    required this.createOn,
    required this.updateOn,
    required this.priraEstrela,
    required this.segEstrela,
    required this.terEstrela,
    required this.quartaEstrela,
    required this.quintaEstrela,
    required this.total,
  });

  factory Rates.fromJson(Map<String, dynamic> json) {
    return Rates(
      id: json['id'],
      createOn: DateTime.parse(json['createOn']),
      updateOn: DateTime.parse(json['updateOn']),
      priraEstrela: json['priraEstrela'],
      segEstrela: json['segEstrela'],
      terEstrela: json['terEstrela'],
      quartaEstrela: json['quartaEstrela'],
      quintaEstrela: json['quintaEstrela'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createOn': createOn.toIso8601String(),
      'updateOn': updateOn.toIso8601String(),
      'priraEstrela': priraEstrela,
      'segEstrela': segEstrela,
      'terEstrela': terEstrela,
      'quartaEstrela': quartaEstrela,
      'quintaEstrela': quintaEstrela,
      'total': total,
    };
  }
}

@HiveType(typeId: 5)
class ImageUrl {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String createOn;

  @HiveField(2)
  late String updateOn;

  @HiveField(3)
  late   Uint8List? path;

  ImageUrl({
    required this.id,
    required this.createOn,
    required this.updateOn,
    required this.path,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) {
    return ImageUrl(
      id: json['id'],
      createOn: json['createOn'],
      updateOn: json['updateOn'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createOn': createOn,
      'updateOn': updateOn,
      'path': path,
    };
  }
}
