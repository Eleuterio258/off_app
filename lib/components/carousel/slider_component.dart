import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 
import '../../cubit/bander/banner_cubit.dart';
import '../../cubit/bander/banner_state.dart';
import 'carousel_slider_data_found.dart';

class SliderComponent extends StatelessWidget {

  const SliderComponent({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return BlocBuilder<BannerCubit, BannerState>(
        builder: (context, state) {
          if (state is BannerInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BannerLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BannerLoaded) {
            return CarouselSliderDataFound(
              carouselList:state.banners,
            );
          } else if (state is BannerError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
        },
      );
  }
}