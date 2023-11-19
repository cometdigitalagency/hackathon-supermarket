import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomBannerSlide extends StatelessWidget {
  const CustomBannerSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 150,
      child: CarouselSlider(
        items: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/000/326/813/large_2x/big-sale-template-banner-vector-background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        ),
      ),
    );
  }
}
