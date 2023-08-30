import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../entities/banner_entity.dart';


class CarouselSliderDataFound extends StatelessWidget {
  final List<BannerEntity> carouselList;
  const CarouselSliderDataFound({Key? key, required this.carouselList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          items: carouselList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Image.memory(item.foto1!));
              },
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
          ),
        ),
      ),
    );
  }
}
