import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/sign_up_response_model.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/routes/app_pages.dart';
class SingupScreenController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
  Rx<TextEditingController> confirmPassController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  Rx<TextEditingController> emailvController = TextEditingController().obs;

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
    var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyOtp");
    var response = await http.post(
        url, body: {'email': '${emailController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'mobile': '${mobileController.value.text.trim()}',
      'otp': '${otpController.value.text.trim()}'});
    print('Response status: ${response.statusCode}');
    if(response.statusCode == 200){
      signUpApi(Get.context!);
    }
    print('Response body: ${response.body}');
  }

  Future<void> sendotpApi() async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/sendOtp");
    var response = await http.post(url, body: {
      'mobile': '${mobileController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'email': '${emailController.value.text.trim()}',
    });
    print('Response status: ${response.statusCode}');

    print('Response body: ${response.body}');
  }
  
  Future<void> signUpApi(BuildContext context) async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/signup");
    var response = await http.post(
        url, body: {'name': '${firstnameController.value.text.trim()}',
      'mobile': '${mobileController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'email': '${emailController.value.text.trim()}',
      'password': '${passController.value.text.trim()}'
    });
    if(response.statusCode == 200){
      SignUpResponseModel res = SignUpResponseModel.fromJson(jsonDecode(response.body));
      showDialog(builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/tick.png"),
                  ),
                ),
              ),
              Text("Success",style: GoogleFonts.raleway(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),),
            ],
          ),
          content: Text("Sign up Successful. Check email for email verification."),
          titleTextStyle: GoogleFonts.raleway(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          contentTextStyle: GoogleFonts.raleway(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          actions: [
            TextButton(onPressed: () {
              Get.toNamed(Routes.LOGIN_SCREEN);
            }, child: Text("Login",style: GoogleFonts.raleway(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(
                  32, 193, 244, 1),
            ),))
          ],
        );
      },context: context);
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
