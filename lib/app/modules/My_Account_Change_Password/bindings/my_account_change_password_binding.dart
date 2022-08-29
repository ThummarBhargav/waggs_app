import 'package:get/get.dart';

import '../controllers/my_account_change_password_controller.dart';

class MyAccountChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAccountChangePasswordController>(
      () => MyAccountChangePasswordController(),
    );
  }
}
