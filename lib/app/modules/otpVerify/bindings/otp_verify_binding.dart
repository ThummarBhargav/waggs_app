import 'package:get/get.dart';

import '../controllers/otp_verify_controller.dart';

class OtpVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpVerifyController>(
      () => OtpVerifyController(),
    );
  }
}
