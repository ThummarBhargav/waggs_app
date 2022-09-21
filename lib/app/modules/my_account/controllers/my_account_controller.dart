import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/ErrorResponse.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class MyAccountController extends GetxController {
  //TODO: Implement MyAccountController

  TextEditingController name = TextEditingController();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
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

  Future<void>sendOtp() async {
    var url = Uri.parse(baseUrl3+ApiConstant.sendOtpUsers);
    await http.post(url, body: {
      'countryCode': '${box.read(ArgumentConstant.countryCode)}',
      'email': 'forgot',
      'mobile': '${box.read(ArgumentConstant.phone)}',
    }).then((value) {
      if(value.statusCode == 200){
        Get.toNamed(Routes.MY_ACCOUNT_CHANGE_PASSWORD);
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
