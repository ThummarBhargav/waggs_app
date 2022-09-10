import 'package:get/get.dart';

import '../controllers/pet_view_details_controller.dart';

class PetViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetViewDetailsController>(
      () => PetViewDetailsController(),
    );
  }
}
