import 'package:hive/hive.dart';
import 'package:off_app/entities/service_entity.dart';
import 'package:off_app/entities/training_entity.dart';
import 'package:path_provider/path_provider.dart';

import '../entities/banner_entity.dart';
import '../entities/concurso_entity.dart';

List<Box> boxList = [];
Future<List<Box>> openBox() async {
  Hive
    ..registerAdapter(BannerEntityAdapter())
    ..registerAdapter(TrainingEntityAdapter())
    ..registerAdapter(ServiceEntityAdapter())
    ..registerAdapter(ConcursoEntityAdapter());
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  var kBannerBox = await Hive.openBox<BannerEntity>("banner");
  var kConcursoBox = await Hive.openBox<ConcursoEntity>("concurso");
  boxList.add(kBannerBox);
  boxList.add(kConcursoBox);
  return boxList;
}

// sava all Banner

Future<void> saveAllBanner(List<BannerEntity> banners) async {
  var bannerBox = boxList[0];
  for (var banner in banners) {
    var bannerLocal = BannerEntity.fromJson(banner.toJson());
    bannerBox.add(bannerLocal);
  }
}

//clean Banner
Future<void> cleanBanner() async {
  var bannerBox = boxList[0];
  bannerBox.deleteAll(bannerBox.keys.toList());
}

//get all Banner
Future<List<BannerEntity>> getAllBanner() async {
  var bannerBox = boxList[0];
  List<BannerEntity> banners = [];
  banners = bannerBox.values.cast<BannerEntity>().toList();
  return banners.map((e) => BannerEntity.fromJson(e.toJson())).toList();
}

//get all Cursos

// save all concurso
Future<void> saveAllConcurso(List<ConcursoEntity> concursos) async {
  var concursoBox = boxList[1];
  for (var concurso in concursos) {
    var concursoLocal = ConcursoEntity.fromJson(concurso.toJson());
    concursoBox.add(concursoLocal);
  }
}

// save one by one

Future<void> saveOneConcurso(ConcursoEntity concurso) async {
  var concursoBox = boxList[1];
  var concursoLocal = ConcursoEntity.fromJson(concurso.toJson());

  concursoBox.put(concursoLocal.id, concursoLocal);
  concursoBox.add(concursoLocal);
}

//clean concurso
Future<void> cleanConcurso() async {
  var concursoBox = boxList[1];
  concursoBox.deleteAll(concursoBox.keys.toList());
}

// get all concurso
Future<List<ConcursoEntity>> getAllConcurso() async {
  var concursoBox = boxList[1];
  List<ConcursoEntity> concursos = [];
  concursos = concursoBox.values.cast<ConcursoEntity>().toList();
  return concursos.map((e) => ConcursoEntity.fromJson(e.toJson())).toList();
}
