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
import '../views/forgot_new_password_view.dart';
import '../views/forgot_send_otp_view.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
  Rx<TextEditingController> confirmPassController = TextEditingController().obs;

  RxBool passwordVisible = false.obs;
  RxBool ispass = false.obs;
  RxBool enableResend1 = false.obs;
  RxInt secondsRemaining1 = 30.obs;
  late Timer timer1;



  @override
  void onInit() {
    countryController.value.text = "+91";
    getTimer1();
    super.onInit();
  }

  getTimer1(){
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

  Future<void>sendOtp() async {
    var url = Uri.parse(baseUrl2 + ApiConstant.sendOtpUsers);
    var response;
    await http.post(url, body: {
      "email": "forgot",
      "countryCode": "${countryController.value.text.trim()}",
      "mobile": "${mobileController.value.text.trim()}"
    }).then((value) {
      if(value.statusCode == 200){
        // Get.offAllNamed(Routes.FORGOT_SEND_OTP);
        Get.to(ForgotSendOtpView());
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
              Get.offAll(ForgotNewPasswordView());
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

  Future<void>NewPassword() async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/changePassword");
    var response;
    await http.post(url, body: {
      "countryCode":"${countryController.value.text.trim()}",
      "mobile":"${mobileController.value.text.trim()}",
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
