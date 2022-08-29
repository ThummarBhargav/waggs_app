import 'package:get/get.dart';

import '../controllers/my_account_new_changed_and_old_password_change_controller.dart';

class MyAccountNewChangedAndOldPasswordChangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAccountNewChangedAndOldPasswordChangeController>(
      () => MyAccountNewChangedAndOldPasswordChangeController(),
    );
  }
}
