import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBar1Controller extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement TabBar1Controller

  late TabController tabController;
  RxInt activeIndex = 0.obs;
  @override
  void onInit() {
    tabController=TabController(length: 3, vsync: this);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }


}
