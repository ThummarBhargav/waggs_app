import 'package:get/get.dart';

import '../controllers/product_detail_view_controller.dart';

class ProductDetailViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailViewController>(
      () => ProductDetailViewController(),
    );
  }
}
