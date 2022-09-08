import 'package:get/get.dart';

import '../controllers/cart_drawer_controller.dart';

class CartDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartDrawerController>(
      () => CartDrawerController(),
    );
  }
}
