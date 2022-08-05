import 'package:get/get.dart';

import '../controllers/o_t_p_screen_controller.dart';

class OTPScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPScreenController>(
      () => OTPScreenController(),
    );
  }
}
