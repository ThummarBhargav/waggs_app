import 'package:get/get.dart';

import '../controllers/forgot_new_password_controller.dart';

class ForgotNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotNewPasswordController>(
      () => ForgotNewPasswordController(),
    );
  }
}
