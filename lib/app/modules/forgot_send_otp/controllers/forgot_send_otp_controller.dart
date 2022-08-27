import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../constant/ConstantUrl.dart';

class ForgotSendOtpController extends GetxController {
  Rx<TextEditingController> sendotp = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;

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
      print("Success");
    }
  }
  verifyotp() async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyOtpNewPassword");
    var response;
    await http.post(url, body: {
      "otp": "${sendotp.value.text.trim()}",
      "countryCode": "${countryController.value.text.trim()}",
      "mobile": "${mobileController.value.text.trim()}"
    }).then((value) {
      response = value;
    }).catchError((error){
      print(error);
    });
    if(response.hashCode==200){
      print("Success");
    }
  }

}
