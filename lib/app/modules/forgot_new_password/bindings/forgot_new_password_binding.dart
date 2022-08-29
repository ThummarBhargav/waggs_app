import 'package:get/get.dart';
import 'package:waggs_app/app/modules/forgot_password/controllers/forgot_password_controller.dart';

import '../controllers/forgot_new_password_controller.dart';

class ForgotNewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
  }
}
