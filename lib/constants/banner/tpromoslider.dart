



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nama_vari/constants/banner/controller.dart';
import 'package:nama_vari/constants/banner/tcircularcontainer.dart';
import 'package:nama_vari/constants/banner/troundimage.dart';
import 'package:nama_vari/constants/color.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.screenHeight, required this.banners,
  });

  final double screenHeight;
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: 
           banners.map((url) => TroundedImages(imageUrl: url, backgroundColor:primaryColor.withOpacity(0.7), borderRadius: 16)).toList(),
          
          options: CarouselOptions( 
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, _) => controller.updatepageIndicator(index),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Obx(
          () => Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                  margin: const EdgeInsets.only(right: 10),
                  width: 20,
                  height: 4,
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? const Color(0xff3E0085)
                      : Colors.grey.shade300,
                )
            ],
          ),
        )
      ],
    );
  }
}
