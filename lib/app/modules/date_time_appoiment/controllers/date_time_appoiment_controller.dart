import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeAppoimentController extends GetxController with GetSingleTickerProviderStateMixin{
  RxBool hasData = false.obs;
  TabController? tabController;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController!.dispose();
  }
}
