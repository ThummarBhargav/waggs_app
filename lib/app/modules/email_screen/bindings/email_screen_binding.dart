import 'package:get/get.dart';

import '../controllers/email_screen_controller.dart';

class EmailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailScreenController>(
      () => EmailScreenController(),
    );
  }
}
