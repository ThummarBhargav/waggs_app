import 'package:get/get.dart';

import '../controllers/catagory_page_controller.dart';

class CatagoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatagoryPageController>(
      () => CatagoryPageController(),
    );
  }
}
