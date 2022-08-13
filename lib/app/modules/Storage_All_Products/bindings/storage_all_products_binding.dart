import 'package:get/get.dart';

import '../controllers/storage_all_products_controller.dart';

class StorageAllProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageAllProductsController>(
      () => StorageAllProductsController(),
    );
  }
}
