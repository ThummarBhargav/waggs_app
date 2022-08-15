import 'package:get/get.dart';

import '../controllers/top_selling_store_all_products_controller.dart';

class TopSellingStoreAllProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopSellingStoreAllProductsController>(
      () => TopSellingStoreAllProductsController(),
    );
  }
}
