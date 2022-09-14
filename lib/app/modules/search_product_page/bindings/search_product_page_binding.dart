import 'package:get/get.dart';

import '../controllers/search_product_page_controller.dart';

class SearchProductPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProductPageController>(
      () => SearchProductPageController(),
    );
  }
}
