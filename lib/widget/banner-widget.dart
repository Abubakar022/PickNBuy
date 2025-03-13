import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_app/controllers/banner-Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController carouselController = CarouselController();
  final bannerController _bannerController = Get.put(bannerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return CarouselSlider(items: _bannerController.bannersUrl.map(
                (imageUrls) =>
                ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(imageUrl: imageUrls,
                      fit: BoxFit.cover,
                      width: Get.width - 10,
                      placeholder
                          : (context, url) =>
                          ColoredBox(color: Colors.white,
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          ),
                    errorWidget: (context,url,error)=>Icon(Icons.error),
                  ),)
        ).toList(), options:
        CarouselOptions(
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          aspectRatio: 2.5,
          viewportFraction: 1,
        ));
      }),
    );
  }
}
