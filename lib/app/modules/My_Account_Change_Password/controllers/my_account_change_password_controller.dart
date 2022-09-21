import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/ErrorResponse.dart';
import 'package:waggs_app/app/Modal/Forget_passwordmodel.dart';
import '../../../../main.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;

class MyAccountChangePasswordController extends GetxController {

  Rx<TextEditingController> otpController = TextEditingController().obs;

  List respons =[];
  RxBool enableResend1 = false.obs;
  RxInt secondsRemaining1 = 30.obs;
  late Timer timer1;

  @override
  void onInit() {
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
  Future<void>verifyOtpUsers() async {
    var url = Uri.parse(baseUrl3+ApiConstant.verifyOtpNewPassword);
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

  Future<void>sendOtp() async {
    var url = Uri.parse(baseUrl3+ApiConstant.sendOtpUsers);
    await http.post(url, body: {
      'countryCode': '${box.read(ArgumentConstant.countryCode)}',
      'email': 'forgot',
      'mobile': '${box.read(ArgumentConstant.phone)}',
    }).then((value) {
      if(value.statusCode == 200){
        // Get.toNamed(Routes.MY_ACCOUNT_CHANGE_PASSWORD);
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
