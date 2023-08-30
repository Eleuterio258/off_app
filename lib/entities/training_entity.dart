import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'training_entity.g.dart';

@HiveType(typeId: 6)
class TrainingEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String createOn;

  @HiveField(2)
  String updateOn;

  @HiveField(3)
  String name;

  @HiveField(4)
  String speaker;

  @HiveField(5)
  String description;

  @HiveField(6)
  String link;

  @HiveField(7)
  double price;

  @HiveField(8)
  String duration;

  @HiveField(9)
  String audience;

  @HiveField(10)
  List<ImageUrl> imageUrl;

  @HiveField(11)
  String email;

  @HiveField(12)
  String program;

  TrainingEntity({
    required this.id,
    required this.createOn,
    required this.updateOn,
    required this.name,
    required this.speaker,
    required this.description,
    required this.link,
    required this.price,
    required this.duration,
    required this.audience,
    required this.imageUrl,
    required this.email,
    required this.program,
  });

  factory TrainingEntity.fromJson(Map<String, dynamic> json) {
    return TrainingEntity(
      id: json['id'],
      createOn: json['createOn'],
      updateOn: json['updateOn'],
      name: json['name'],
      speaker: json['speaker'],
      description: json['description'],
      link: json['link'],
      price: json['price'].toDouble(),
      duration: json['duracao'],
      audience: json['publico'],
      imageUrl: List<ImageUrl>.from(
          json['imageUrl']?.map((x) => ImageUrl.fromJson(x)) ?? []),
      email: json['email'],
      program: json['program'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createOn': createOn,
      'updateOn': updateOn,
      'name': name,
      'speaker': speaker,
      'description': description,
      'link': link,
      'price': price,
      'duracao': duration,
      'publico': audience,
      'imageUrl': imageUrl.map((x) => x.toJson()).toList(),
      'email': email,
      'program': program,
    };
  }
}

@HiveType(typeId: 7)
class ImageUrl extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  DateTime createOn;

  @HiveField(2)
  DateTime updateOn;

  @HiveField(3)
  Uint8List path;

  ImageUrl({
    required this.id,
    required this.createOn,
    required this.updateOn,
    required this.path,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) {
    return ImageUrl(
      id: json['id'],
      createOn: DateTime.parse(json['createOn']),
      updateOn: DateTime.parse(json['updateOn']),
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createOn': createOn.toIso8601String(),
      'updateOn': updateOn.toIso8601String(),
      'path': path,
    };
  }
}
