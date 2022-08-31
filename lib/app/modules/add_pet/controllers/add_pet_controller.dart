import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPetController extends GetxController {
  //TODO: Implement AddPetController

  TextEditingController name = TextEditingController(text: 'New Pet');
  TextEditingController Gender = TextEditingController(text: 'New Pet');
  TextEditingController age = TextEditingController();
  TextEditingController breed = TextEditingController();
  RxList<String> gender = RxList<String>(["Male","Female"]);
  RxString select=''.obs;
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


}
