import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';

class ViewProductView extends GetWidget<HomeController> {
  int index;
  ViewProductView(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewProductView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            controller.productList[index].title!,
            style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            ),
          ),
          ImageSlideshow(
              width: double.infinity,
              height: 400,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              // autoPlayInterval: 3000,
              isLoop: false,
              children:[
                Image(image:  NetworkImage(
                    "${controller.productList[index].images![0]}"),
                ),
    ],
          )
        ],
      ),
    );
  }
}
