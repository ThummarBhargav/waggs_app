import 'package:get/get.dart';

import '../controllers/book_appoiment_controller.dart';

class BookAppoimentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookAppoimentController>(
      () => BookAppoimentController(),
    );
  }
}
