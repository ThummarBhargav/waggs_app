import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/productCard_const.dart';
import '../controllers/search_product_page_controller.dart';

class SearchProductPageView extends GetWidget<SearchProductPageController> {
  const SearchProductPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(Routes.HOME);
        return await true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('SearchProductPageView'),
            centerTitle: true,
          ),
          body: Column(
            children: [],
          )),
    );
  }
}
