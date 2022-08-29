import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/routes/app_pages.dart';
import '../../../Modal/ErrorResponse.dart';
import '../../../constant/ConstantUrl.dart';

class ForgotSendOtpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;

  RxBool passwordVisible = true.obs;
  RxInt secondsRemaining1 = 30.obs;
  RxBool enableResend1 = false.obs;
  late Timer timer1;

  @override
  void onInit() {
    super.onInit();
    gettimer();
  }

  gettimer(){
    timer1 = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining1.value != 0) {
        enableResend1.value = false;
        secondsRemaining1.value--;
        refresh();

      } else {

        enableResend1.value = true;
        refresh();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  sendOtp() async {
    var url = Uri.parse(baseUrl2 + ApiConstant.sendOtpUsers);
    var response;
    await http.post(url, body: {
      "email": "forgot",
      "countryCode": "${countryController.value.text.trim()}",
      "mobile": "${mobileController.value.text.trim()}"
    }).then((value) {
      response = value;
    }).catchError((error){
      print(error);
    });
    if(response.hashCode==200){
      Get.toNamed(Routes.FORGOT_SEND_OTP);
    }
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
        Get.offAllNamed(Routes.FORGOT_NEW_PASSWORD);
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
