import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';

import '../controllers/view_product_controller.dart';

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
            controller.UserList[index].title!,
            style: GoogleFonts.roboto(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
