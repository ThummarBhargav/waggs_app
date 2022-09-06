import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../Modal/ErrorResponse.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import '../../../routes/app_pages.dart';

class MobileVerifyController extends GetxController {
  //TODO: Implement MobileVerifyController
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  RxBool isNumberExist = false.obs;
  bool  isFromFacebook = false ;
  UserCredential? userData ;
  String name = '';
  String email = '';
  String socialId = '';
  String socialType = '';
  @override
  void onInit() {
    countryController.value.text = "+91";
    if(Get.arguments!=null){
      if(!isNullEmptyOrFalse(Get.arguments[ArgumentConstant.isFromFacebookLogin])){
        isFromFacebook = Get.arguments[ArgumentConstant.isFromFacebookLogin];
        userData = Get.arguments[ArgumentConstant.userData];
      }
      else{
        isFromFacebook = false;
      }
    }
    else{
      isFromFacebook = false;
    }
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
  void verifyPhone(BuildContext context) async {
    var url = Uri.parse(baseUrl3+ApiConstant.verifyExistsUsers);
    await http.post(url, body: {
      'mobile': '${mobileController.value.text.trim()}',
    }).then((value) {
      print(value.statusCode);
      if (value.statusCode == 200) {
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(value.body));
        if (res.responseCode == 200) {

        }
      } else {
        isNumberExist.value = true;
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(value.body));
        // Get.snackbar("Error", res.message.toString(),snackPosition: SnackPosition.TOP);
      }
    });
  }

  Future<void>sendOtp() async {
    var url = Uri.parse(baseUrl3 + ApiConstant.sendOtpUsers);
    var response;
    await http.post(url, body: {
      "countryCode": "${countryController.value.text.trim()}",
      "mobile": "${mobileController.value.text.trim()}"
    }).then((value) {
      if(value.statusCode == 200){
        name = userData!.user!.displayName.toString();
        email = userData!.user!.email.toString();
        socialId=userData!.credential!.providerId.toString();
        socialType = userData!.credential!.signInMethod.toString();
        Get.offAllNamed(Routes.OTP_VERIFY,arguments: {
          ArgumentConstant.isFromMobile : true,
          ArgumentConstant.name : name,
          ArgumentConstant.email : email,
          ArgumentConstant.socialId : socialId,
          ArgumentConstant.socialType : socialType,
          ArgumentConstant.mobile : mobileController.value.text.trim(),
          ArgumentConstant.countryCode : countryController.value.text.trim(),

        });
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
