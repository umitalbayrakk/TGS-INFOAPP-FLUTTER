import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CourselSlider extends StatelessWidget {
  CourselSlider({super.key});
  final List<String> imageList = ['assets/images/apron.png', 'assets/images/apron2.png', 'assets/images/new.png'];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
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
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(item, fit: BoxFit.cover, width: double.infinity),
            );
          }).toList(),
    );
  }
}
