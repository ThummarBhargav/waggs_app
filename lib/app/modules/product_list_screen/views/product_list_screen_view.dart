import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waggs_app/app/modules/product_list_screen/views/subCategory_data_widget.dart';
import 'package:waggs_app/app/modules/product_list_screen/views/top_selling_product_list_widget.dart';
import 'package:waggs_app/app/modules/product_list_screen/views/top_selling_store_list_widget.dart';

import '../controllers/product_list_screen_controller.dart';

class ProductListScreenView extends GetWidget<ProductListScreenController> {
  const ProductListScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (controller.isFromSellingStore)
          ? TopSellingStoreWidget(controller: controller)
          : (controller.isFromTopProducts)
              ? TopSellingProductListWidget(controller: controller)
              : (controller.isFromSubCategory)
                  ? SubCategoryWidget(controller: controller)
                  : SizedBox(),
    );
  }
}
