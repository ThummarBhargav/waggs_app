import 'package:get/get.dart';

import '../controllers/view_all_my_cart_controller.dart';

class ViewAllMyCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAllMyCartController>(
      () => ViewAllMyCartController(),
    );
  }
}
