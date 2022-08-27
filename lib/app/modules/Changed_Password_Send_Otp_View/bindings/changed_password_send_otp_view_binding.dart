import 'package:get/get.dart';

import '../controllers/changed_password_send_otp_view_controller.dart';

class ChangedPasswordSendOtpViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangedPasswordSendOtpViewController>(
      () => ChangedPasswordSendOtpViewController(),
    );
  }
}
