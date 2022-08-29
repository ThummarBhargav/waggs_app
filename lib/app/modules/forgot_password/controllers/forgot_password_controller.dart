import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/Forget_passwordmodel.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/main.dart';

import '../../../Modal/ErrorResponse.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  RxBool passwordVisible = true.obs;

  @override
  void onInit() {
    countryController.value.text = "+91";
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

  Future<void>sendOtp() async {
    var url = Uri.parse(baseUrl2 + ApiConstant.sendOtpUsers);
    var response;
    await http.post(url, body: {
      "email": "forgot",
      "countryCode": "${countryController.value.text.trim()}",
      "mobile": "${mobileController.value.text.trim()}"
    }).then((value) {
      if(value.statusCode == 200){
        Get.offAllNamed(Routes.FORGOT_SEND_OTP);
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
  Future<void>verifyotp() async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyOtpNewPassword");
    var response;
    await http.post(url, body: {
      "otp": "${otpController.value.text.trim()}",
      "countryCode": "${countryController.value.text.trim()}",
      "mobile": "${mobileController.value.text.trim()}"
    }).then((value) {
      if(value.statusCode == 200){
        FpassModel res  = FpassModel.fromJson(jsonDecode(value.body));
              box.write(ArgumentConstant.token1, res.data!.newPasswordToken);
              Get.offAllNamed(Routes.FORGOT_NEW_PASSWORD);

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
