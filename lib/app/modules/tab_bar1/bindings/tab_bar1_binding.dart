import 'package:get/get.dart';

import '../controllers/tab_bar1_controller.dart';

class TabBar1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBar1Controller>(
      () => TabBar1Controller(),
    );
  }
}
