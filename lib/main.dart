import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:off_app/cubit/bander/banner_cubit.dart';
import 'package:off_app/cubit/concurso_bloc/concurso_bloc.dart';
import 'package:off_app/cubit/concurso_bloc/concurso_event.dart';
import 'package:off_app/cubit/course_bloc/course_bloc.dart';
import 'package:off_app/cubit/course_bloc/course_event.dart';
import 'package:off_app/cubit/service_bloc/service_bloc.dart';
import 'package:off_app/cubit/service_bloc/service_event.dart';
import 'package:off_app/dao/hive_dao.dart';
import 'package:off_app/page/home_page.dart';
import 'package:off_app/repository/remoto/banner_repository.dart';
import 'package:off_app/repository/remoto/concurso_respositoty.dart';
import 'package:off_app/repository/remoto/course_respositoty.dart';
import 'package:off_app/simple_bloc_observer.dart';

import 'repository/remoto/service_respositoty.dart';

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await openBox();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ConcursoBloc(concursoRespositoty: ConcursoRespositoty())
                ..add(ConcursoLoadEvent()),
        ),
        BlocProvider(
          create: (context) =>
              ServiceBloc(serviceRespositoty: ServiceRespositoty())
                ..add(ServiceLoadEvent()),
        ),
        BlocProvider(
          create: (context) =>
              CourseBloc(courseRespositoty: CourseRespositoty())
                ..add(CourseLoadEvent()),
        ),
        BlocProvider(
          create: (context) =>
              BannerCubit(bannerRespositoty: BannerRespositoty()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
