import 'package:get/get.dart';

import '../controllers/forgot_send_otp_controller.dart';

class ForgotSendOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotSendOtpController>(
      () => ForgotSendOtpController(),
    );
  }
}
