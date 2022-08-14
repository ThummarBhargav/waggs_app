import 'package:get/get.dart';

import '../controllers/product_all_controller.dart';

class ProductAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductAllController>(
      () => ProductAllController(),
    );
  }
}
