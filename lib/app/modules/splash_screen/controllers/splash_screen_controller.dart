import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(milliseconds: 1500), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
