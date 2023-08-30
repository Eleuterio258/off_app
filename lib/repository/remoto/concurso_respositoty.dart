import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:off_app/helper/convert_images.dart';
import '../../dao/hive_dao.dart';
import '../../entities/concurso_entity.dart';
import '../../helper/constants.dart';
import '../../helper/custom_exception.dart';

class ConcursoRespositoty {
  List<ConcursoEntity> concursos = [];
  Future<List<ConcursoEntity>> getData() async {
    if (await networkInfoImp.isConnected) {
      await cleanConcurso();

      final response = await http.get(
          Uri.parse("https://server.freela.co.mz/concurso/"),
          headers: {'Content-Type': 'application/json'});

      var data = json.decode(utf8.decode(response.bodyBytes))["content"];

      // FUNÇÃO PARA ARMAZENAR DADOS LISTA
      for (int i = 0; i < data.length; i++) {
        concursos.add(ConcursoEntity(
            createOn: data[i]["createOn"],
            attachment: await uploadImage(data[i]['attachment']),
            empresa: data[i]["empresa"],
            id: data[i]["id"],
            description: data[i]['description'],
            estado: data[i]['estado'],
            finalDate: data[i]['finalDate'],
            termoReferencia: data[i]['termoreferencia'],
            price: data[i]['price'],
            name: data[i]['name'],
            updateOn: data[i]["updateOn"],
            category: data[i]['category'],
            notificado: data[i]['notificado']));
      }

      await saveAllConcurso(concursos);

      return concursos;
    } else {
      var listConcursos = await getAllConcurso();

      return listConcursos;
    }
  }

  //   List<ConcursoModel> concursos = [];
  // Future<List<ConcursoModel>> getData() async {
  //   try {
  //     final response = await http.get(Uri.parse("https://server.freela.co.mz/concurso/"));

  //     var data = json.decode(utf8.decode(response.bodyBytes));

  //     var couse = await data["content"]
  //         .map<ConcursoModel>((json) => ConcursoModel.fromJson(json))
  //         .toList();

  //     return couse;
  //   } on SocketException {
  //     throw FetchDataException("Sem conexão com a Internet");
  //   }
  // }

  Future<ConcursoEntity> getDjob(int id) async {
    try {
      final response =
          await http.get(Uri.parse("https://server.freela.co.mz/concurso/$id"));

      var data = json.decode(utf8.decode(response.bodyBytes));

      var curso = ConcursoEntity.fromJson(data['content']);
      return curso;
    } on SocketException {
      throw FetchDataException("Sem conexão com a Internet");
    }
  }
}
