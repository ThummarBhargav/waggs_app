import 'package:get/get.dart';

import '../controllers/mobile_verify_controller.dart';

class MobileVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileVerifyController>(
      () => MobileVerifyController(),
    );
  }
}
