import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/Forget_passwordmodel.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/main.dart';

class ForgotNewPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> passController = TextEditingController().obs;
  Rx<TextEditingController> confirmPassController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  RxBool passwordVisible = false.obs;
  RxBool ispass = false.obs;
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
    var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyOtpNewPassword");
    var response;
    await http.post(url, body: {
      "countryCode": "${countryController.value.text.trim()}",
      "mobile": "${mobileController.value.text.trim()}",
      "password":"${passController.value.text.trim()}",
      "newPasswordToken":"${box.read(ArgumentConstant.token1)}",
    }).then((value) {
      if(value.statusCode == 200){
        FpassModel res  = FpassModel.fromJson(jsonDecode(value.body));
        Get.offAll(Routes.LOGIN_SCREEN);
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
