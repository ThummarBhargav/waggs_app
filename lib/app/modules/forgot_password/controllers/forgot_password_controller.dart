import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
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
}
