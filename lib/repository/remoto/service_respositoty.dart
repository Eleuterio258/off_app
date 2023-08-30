import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:off_app/entities/service_entity.dart';

import '../../helper/custom_exception.dart';

int pageCount = 0;

class ServiceRespositoty {
  static var client = http.Client();

  Future<List<ServiceEntity>> getServicePaginate() async {
    pageCount = pageCount + 1;
    try {
      final response = await client.get(
          Uri.parse("https://server.freela.co.mz/service/"),
          headers: {'Content-Type': 'application/json'});

      var data = json.decode(utf8.decode(response.bodyBytes));

      var service = await data["object"]
          .map<ServiceEntity>((json) => ServiceEntity.fromJson(json))
          .toList();

      return service;
    } on SocketException {
      throw FetchDataException("Sem conexão com a Internet");
    }
  }

  Future<List<ServiceEntity>> getServices() async {
    try {
      final response = await client.get(
          Uri.parse("https://server.freela.co.mz/service/todos/"),
          headers: {'Content-Type': 'application/json'});

      var data = json.decode(utf8.decode(response.bodyBytes));

      var service = await data["object"]
          .map<ServiceEntity>((json) => ServiceEntity.fromJson(json))
          .toList();

      return service;
    } on SocketException {
      throw FetchDataException("Sem conexão com a Internet");
    }
  }

  Future<List<ServiceEntity>> getServicesByOwner(String email) async {
    try {
      final response = await client.get(
          Uri.parse("https://server.freela.co.mz/mobile/$email"),
          headers: {'Content-Type': 'application/json'});

      var data = json.decode(utf8.decode(response.bodyBytes));

      var service = await data["object"]
          .map<ServiceEntity>((json) => ServiceEntity.fromJson(json))
          .toList();
      return service;
    } on SocketException {
      throw FetchDataException("Sem conexão com a Internet");
    }
  }

  Future<List<ServiceEntity>> getService(int id) async {
    try {
      var response =
          await Dio().get("https://server.freela.co.mz/subcategory/$id/");
      List<ServiceEntity> services = [];

      for (var service in response.data['object']) {
        services.add(ServiceEntity.fromJson(service));
      }

      return services;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw const SocketException('Connection timeout');
      } else {
        throw "Sem conexão com a Internet";
      }
    }
  }

  // Future<List<ComentService>> getComentService(int id) async {
  //   try {
  //     var response =
  //         await Dio().get("https://server.freela.co.mz/comment/$id");

  //     List<ComentService> services = [];

  //     for (var service in response.data['content']) {
  //       services.add(ComentService.fromJson(service));
  //     }

  //     return services;
  //   } on DioError catch (e) {
  //     if (e.type == DioErrorType.connectionTimeout ||
  //         e.type == DioErrorType.receiveTimeout) {
  //       throw const SocketException('Connection timeout');
  //     } else {
  //       throw "Sem conexão com a Internet";
  //     }
  //   }
  // }

  //https://server.freela.co.mz/service/rate/eleuterio.notico@cbe.co.mz/4/6339

  //setRate
  Future<bool> setRate(String email, int rate, int id) async {
    try {
      var response = await Dio()
          .get("https://server.freela.co.mz/service/rate/$email/$rate/$id",
              options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                },
              ));

      if (response.statusCode == 200) {
        // Future.delayed(const Duration(milliseconds: 200), () {
        //   Get.snackbar("Info", "Voce Ad", backgroundColor: Asset.myColor);
        // });
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw const SocketException('Connection timeout');
      } else {
        throw "Sem conexão com a Internet";
      }
    }
  }
}
