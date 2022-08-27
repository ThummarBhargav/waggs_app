import 'package:get/get.dart';

import '../controllers/plane_controller.dart';

class PlaneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaneController>(
      () => PlaneController(),
    );
  }
}
