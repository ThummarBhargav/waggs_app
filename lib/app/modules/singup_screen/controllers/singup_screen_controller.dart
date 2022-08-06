import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
class SingupScreenController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
  Rx<TextEditingController> confirmPassController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;


  RxBool isChecked = false.obs;
  RxBool passwordVisible = true.obs;


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

  void otpApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.verifyOtpUsers);
    var response = await http.post(
        url, body: {'email': '${emailController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'mobile': '${mobileController.value.text.trim()}',
      'otp': '${otpController.value.text.trim()}'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<void> sendotpApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.sendOtpUsers);
    var response = await http.post(url, body: {
      'mobile': '${mobileController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'email': '${emailController.value.text.trim()}',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<void> EmailApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.verifyEmailUsers);
    var response = await http.post(url, body: {
      '_id': '${emailController.value.text.trim()}',
      'emailVerificationToken':'',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<void> signUpApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.signUpUsers);
    var response = await http.post(
        url, body: {'name': '${firstnameController.value.text.trim()}',
      'mobile': '${mobileController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'email': '${emailController.value.text.trim()}',
      'password': '${passController.value.text.trim()}'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
