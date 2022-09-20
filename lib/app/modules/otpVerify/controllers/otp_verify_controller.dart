import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/main.dart';
import '../../../Modal/ErrorResponse.dart';
import '../../../Modal/my_sign_up_model.dart';
import '../../../Modal/sign_up_response_model.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import '../../../routes/app_pages.dart';

class OtpVerifyController extends GetxController {
  //TODO: Implement OtpVerifyController
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  Rx<TextEditingController> otpController = TextEditingController().obs;
  RxBool enableResend = false.obs;
  RxInt secondsRemaining = 30.obs;
  String mobileNumber = "";
  String countryCode = "";
  String name = '';
  String email = '';
  String socialId = '';
  String socialType = '';
  late Timer timer;
  bool isFromMobile = false;
  final count = 0.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      isFromMobile = Get.arguments[ArgumentConstant.isFromMobile];
      mobileNumber = Get.arguments[ArgumentConstant.mobile];
      countryCode = Get.arguments[ArgumentConstant.countryCode];
      name = Get.arguments[ArgumentConstant.name];
      email = Get.arguments[ArgumentConstant.email];
      socialId = Get.arguments[ArgumentConstant.socialId];
      socialType = Get.arguments[ArgumentConstant.socialType];
    }
    gettimer();
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

  gettimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value != 0) {
        enableResend.value = false;
        secondsRemaining.value--;
        refresh();
      } else {
        enableResend.value = true;
        refresh();
      }
    });
  }

  void otpApi(BuildContext context) async {
    var url = Uri.parse(baseUrl3 + ApiConstant.verifyOtpUsers);
    var response;
    await http.post(url, body: {
      'countryCode': countryCode,
      'mobile': mobileNumber,
      'email': email,
      'otp': '${otpController.value.text.trim()}'
    }).then((value) async {
      print(value.statusCode);
      print(value.body);
      response = value;
      print(response);
      if (value.statusCode == 200) {
        signUp(context);
      } else {
        Get.snackbar("Error", "Something Went Wrong!!!");
      }
    });
  }

  Future<void> signUp(BuildContext context) async {
    try {
      var url = Uri.parse(baseUrl3 + ApiConstant.signUpUsers);
      var response;
      await http.post(url, body: {
        "name": "${name}",
        "mobile": "${mobileNumber}",
        "countryCode": "${countryCode}",
        "email": "${email}",
        "socialId": "${socialId}",
        "socialType": "${socialType}"
      }).then((value) {
        print(value.body);
        response = value;
        if (response.statusCode == 200) {
          MySignUpModel res = MySignUpModel.fromJson(jsonDecode(response.body));
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.token!)) {
              box.write(ArgumentConstant.token, res.data!.token!);
              box.write(ArgumentConstant.isUserLogin, true);
              box.write(ArgumentConstant.email, email);
              Get.offAllNamed(Routes.HOME);
            }
          }
        } else {
          ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
          Get.snackbar("Error", res.message.toString(),
              snackPosition: SnackPosition.BOTTOM);
        }
      }).catchError((error) {
        print(error);
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> sendOtp() async {
    var url = Uri.parse(baseUrl3 + ApiConstant.sendOtpUsers);
    var response;
    await http.post(url, body: {
      "countryCode": "${countryCode}",
      "mobile": "${mobileNumber}"
    }).then((value) {
      if (value.statusCode == 200) {
      } else {
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(value.body));
        Get.snackbar("Error", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }
      print('Response status: ${value.statusCode}');
      print('Response body: ${value.body}');
    }).catchError((error) {
      print(error);
    });
  }
}
