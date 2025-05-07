import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CourselSlider extends StatelessWidget {
  CourselSlider({super.key});
  final List<String> imageList = [
    'assets/images/uygulama-next_00013_.png',
    'assets/images/uygulama-next_00015_.png',
    'assets/images/uygulama-next_00016_.png',
    'assets/images/uygulama-next_00043_.png',
    'assets/images/uygulama-next_00044_.png',
    'assets/images/uygulama-next_00075_.png',
    'assets/images/uygulama-next_00035_.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          enableInfiniteScroll: true,
        ),
        items:
            imageList.map((item) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(item, fit: BoxFit.cover, width: double.infinity),
              );
            }).toList(),
      ),
    );
  }
}
