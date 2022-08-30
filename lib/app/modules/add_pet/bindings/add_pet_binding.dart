import 'package:get/get.dart';

import '../controllers/add_pet_controller.dart';

class AddPetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPetController>(
      () => AddPetController(),
    );
  }
}
