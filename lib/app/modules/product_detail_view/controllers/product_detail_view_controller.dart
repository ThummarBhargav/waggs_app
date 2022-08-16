import 'package:get/get.dart';

class ProductDetailViewController extends GetxController {
  //TODO: Implement ProductDetailViewController

  final count = 0.obs;
  RxBool isOpen = false.obs;
  RxBool isOpen1 = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
