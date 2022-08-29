import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/ErrorResponse.dart';
import 'package:waggs_app/app/Modal/Forget_passwordmodel.dart';

import '../../../../main.dart';
import '../../../Modal/login_model.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;

class MyAccountChangePasswordController extends GetxController {

  Rx<TextEditingController> otpController = TextEditingController().obs;

  List respons =[];

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
  Future<void>verifyOtpUsers() async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyOtpNewPassword");
    var response;
    await http.post(url, body: {
      'countryCode': '${box.read(ArgumentConstant.countryCode)}',
      'mobile': '${box.read(ArgumentConstant.phone)}',
      'otp': '${otpController.value.text.trim()}',
    }).then((value) {
      if(value.statusCode == 200){
        FpassModel res  = FpassModel.fromJson(jsonDecode(value.body));
        box.write(ArgumentConstant.token1, res.data!.newPasswordToken);
        Get.toNamed(Routes.MY_ACCOUNT_NEW_CHANGED_AND_OLD_PASSWORD_CHANGE);
      }
      else
      {
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(value.body));
        Get.snackbar("Error", res.message.toString(),snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.red);
      }
      print('Response status: ${value.statusCode}');
      print('Response body: ${value.body}');
    }).catchError((error){
      print(error);
    });
  }

}
