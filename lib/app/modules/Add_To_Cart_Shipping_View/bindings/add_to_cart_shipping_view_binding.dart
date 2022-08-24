import 'package:get/get.dart';

import '../controllers/add_to_cart_shipping_view_controller.dart';

class AddToCartShippingViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToCartShippingViewController>(
      () => AddToCartShippingViewController(),
    );
  }
}
