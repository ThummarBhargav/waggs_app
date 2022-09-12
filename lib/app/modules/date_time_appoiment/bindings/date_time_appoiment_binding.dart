import 'package:get/get.dart';

import '../controllers/date_time_appoiment_controller.dart';

class DateTimeAppoimentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DateTimeAppoimentController>(
      () => DateTimeAppoimentController(),
    );
  }
}
