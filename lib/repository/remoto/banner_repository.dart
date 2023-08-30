import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:off_app/entities/banner_entity.dart';

import '../../dao/hive_dao.dart';
import '../../helper/constants.dart';
import '../../helper/convert_images.dart';

class BannerRespositoty {
  List<BannerEntity> banners = [];
  Future<List<BannerEntity>> getBanners() async {
    if (await networkInfoImp.isConnected) {
      await cleanBanner();
      final response = await http.get(
          Uri.parse("https://server.freela.co.mz/ads/foto/banner/"),
          headers: {'Content-Type': 'application/json'});

      var data = json.decode(utf8.decode(response.bodyBytes))["content"];

      for (int i = 0; i < data.length; i++) {
        banners.add(BannerEntity(
          createOn: data[i]["createOn"],
          foto1: await uploadImage(data[i]["foto1"]),
          empresa: data[i]["empresa"],
          id: data[i]["id"],
          localDaPublicidade: data[i]["localDaPublicidade"],
          updateOn: data[i]["updateOn"],
          visivel: data[i]["visivel"],
        ));
      }

      await saveAllBanner(banners);

      return banners;
    } else {
      var listBanner = await getAllBanner();

      return listBanner;
    }
  }
}
