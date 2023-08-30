import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/remoto/banner_repository.dart';
import 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final BannerRespositoty bannerRespositoty;
  BannerCubit({required this.bannerRespositoty}) : super(BannerInitial());

  Future<void> getBanners() async {
    try {
      emit(BannerLoading());
      final banners = await bannerRespositoty.getBanners();
      emit(BannerLoaded(banners: banners));
    } catch (e) {
      emit(BannerError(e.toString()));
    }
  }
}
