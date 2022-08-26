import 'package:get/get.dart';

import '../controllers/change_password_send_otp_view_controller.dart';

class ChangePasswordSendOtpViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordSendOtpViewController>(
      () => ChangePasswordSendOtpViewController(),
    );
  }
}
