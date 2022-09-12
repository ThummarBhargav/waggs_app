import 'package:get/get.dart';

import '../controllers/vet_view_details_controller.dart';

class VetViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VetViewDetailsController>(
      () => VetViewDetailsController(),
    );
  }
}
