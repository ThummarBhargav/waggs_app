import 'package:get/get.dart';

import '../controllers/my_pet_controller.dart';

class MyPetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPetController>(
      () => MyPetController(),
    );
  }
}
