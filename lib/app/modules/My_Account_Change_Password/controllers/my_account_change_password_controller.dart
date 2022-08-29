import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  Future<void> verifyOtpUsers() async {
    try{
      var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyOtpNewPassword");
      var response = await http.post(url, body: {
        'countryCode': '${box.read(ArgumentConstant.countryCode)}',
        'mobile': '${box.read(ArgumentConstant.phone)}',
        'otp': '${otpController.value.text.trim()}',
      }
      );
      respons.add(response.body);
      print(jsonDecode(response.body).runtimeType);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(response.statusCode==200){
        LoginModel res  = LoginModel.fromJson(jsonDecode(response.body));
        if(res.responseCode == 200){
          Get.toNamed(Routes.MY_ACCOUNT_CHANGE_PASSWORD);
        }
      }
      else{
        Get.snackbar("Error", response.body,snackPosition: SnackPosition.BOTTOM);
      }
    }catch(e){
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,);
    }
  }

}
