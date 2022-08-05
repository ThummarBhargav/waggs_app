import 'package:get/get.dart';

import '../controllers/singup_screen_controller.dart';

class SingupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingupScreenController>(
      () => SingupScreenController(),
    );
  }
}
