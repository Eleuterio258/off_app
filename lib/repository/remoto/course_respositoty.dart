import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:off_app/entities/concurso_entity.dart';
import 'package:off_app/entities/training_entity.dart';

import '../../helper/constants.dart';
import '../../helper/custom_exception.dart';

class CourseRespositoty {
  List<TrainingEntity> training = [];
  Future<List<TrainingEntity>> getCursos() async {
    if (await networkInfoImp.isConnected) {
      final response = await http.get(
          Uri.parse("https://server.freela.co.mz/Coursesandlectures/courses/"));

      var data = json.decode(utf8.decode(response.bodyBytes));

      var couse = await data["content"]
          .map<TrainingEntity>((json) => TrainingEntity.fromJson(json))
          .toList();

      for (int i = 0; i < data.length; i++) {
        training.add(
          TrainingEntity(
              audience: data[i],
              createOn: data[i]['createOn'],
              description: data[i]['description'],
              duration: data[i]['duration'],
              email: data[i]['email'],
              id: data[i]['id'],
              imageUrl: [],
              link: data[i]['link'],
              name: data[i]['name'],
              price: data[i]['price'],
              program: data[i]['program'],
              speaker: data[i]['speaker'],
              updateOn: data[i]['updateOn']),
        );
      }

      return couse;
    } else {
      return [];
    }
  }
}

Future<ConcursoEntity> getJob(int id) async {
  try {
    final response = await http
        .get(Uri.parse("https://server.freela.co.mz/notificacao/user/$id"));

    var data = json.decode(utf8.decode(response.bodyBytes));
    var curso = ConcursoEntity.fromJson(data['content']);
    return curso;
  } on SocketException {
    throw FetchDataException("Sem conexão com a Internet");
  }
}

Future<List<ConcursoEntity>> getCursoss() async {
  try {
    var response = await Dio().get(
      "https://server.freela.co.mz/Coursesandlectures/courses/",
    );
    List<ConcursoEntity> cursos = [];

    for (var curso in response.data['content']) {
      cursos.add(ConcursoEntity.fromJson(curso));
    }

    return cursos;
  } on DioError catch (e) {
    if (e.type == DioErrorType.connectionTimeout ||
        e.type == DioErrorType.receiveTimeout) {
      throw const SocketException('Connection timeout');
    } else {
      throw "Sem conexão com a Internet";
    }
  }
}

Future<List<ConcursoEntity>> getlectures() async {
  try {
    final response = await http.get(
        Uri.parse("https://server.freela.co.mz/Coursesandlectures/lectures/"));

    var data = json.decode(utf8.decode(response.bodyBytes));

    var couse = await data["content"]
        .map<ConcursoEntity>((json) => ConcursoEntity.fromJson(json))
        .toList();

    return couse;
  } on SocketException {
    throw FetchDataException("Sem conexão com a Internet");
  }
}
