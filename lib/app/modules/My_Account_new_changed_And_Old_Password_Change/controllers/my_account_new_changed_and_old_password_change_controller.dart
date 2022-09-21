import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/main.dart';

import '../../../Modal/Forget_passwordmodel.dart';
import '../../../routes/app_pages.dart';

class MyAccountNewChangedAndOldPasswordChangeController extends GetxController {

  GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  Rx<TextEditingController> passController = TextEditingController().obs;
  Rx<TextEditingController> confirmPassController = TextEditingController().obs;

  RxBool ispass = false.obs;
  RxBool passwordVisible = false.obs;

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

  Future<void>NewPassword() async {
    var url = Uri.parse(baseUrl3+ApiConstant.changePassword);
    await http.post(url, body: {
      "countryCode":"${box.read(ArgumentConstant.countryCode)}",
      "mobile":"${box.read(ArgumentConstant.phone)}",
      "newPasswordToken":"${box.read(ArgumentConstant.token1)}",
      "password":"${passController.value.text.trim()}"
    }).then((value) {
      if(value.statusCode == 200){
        FpassModel res  = FpassModel.fromJson(jsonDecode(value.body));
        Get.snackbar("Success", res.message.toString(),snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green,colorText: Colors.white);
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      }
      else{
        FpassModel res  = FpassModel.fromJson(jsonDecode(value.body));
        Get.snackbar("Error", res.message.toString(),snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red,colorText: Colors.white);
      }
    }
    ).catchError((error){
      print(error);
    });
  }

}
