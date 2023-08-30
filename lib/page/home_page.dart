import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:off_app/page/list_concurso.dart';
import 'package:off_app/page/list_curso.dart';
import 'package:off_app/page/list_service.dart';

 
import '../components/carousel/slider_component.dart';
import '../cubit/bander/banner_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<BannerCubit>(context).getBanners();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(children: const [
        SliderComponent(),
        ListConcurso(),
        ListCurso(),
        ListService()
      ]),
    );
  }
}
