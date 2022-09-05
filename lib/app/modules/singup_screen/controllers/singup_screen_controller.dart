import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/ErrorResponse.dart';
import 'package:waggs_app/app/Modal/sign_up_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

class SingupScreenController extends GetxController {
  RxBool colorOtpVerification = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
  Rx<TextEditingController> confirmPassController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  Rx<TextEditingController> emailvController = TextEditingController().obs;
  ErrorResponse error = ErrorResponse();
  RxList<ErrorResponse> errorList = RxList<ErrorResponse>([]);
  RxBool isNumberExist = false.obs;
  RxBool isEmailExist = false.obs;
  RxBool ispass = false.obs;
  RxBool isChecked = false.obs;
  RxBool passwordVisible = true.obs;
  RxInt secondsRemaining = 30.obs;
  RxBool enableResend = false.obs;
  late Timer timer;
  @override
  void onInit() {
    countryController.value.text = "+91";
    super.onInit();
  }
gettimer(){
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
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void otpApi(BuildContext context) async {
    var url = Uri.parse(baseUrl3+ApiConstant.verifyOtpUsers);
    var response;
    await http.post(url, body: {
      'email': '${emailController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'mobile': '${mobileController.value.text.trim()}',
      'otp': '${otpController.value.text.trim()}'
    }).then((value) async {
      print(value.statusCode);
      print(value.body);
      response=value;
      print(response);
      if (value.statusCode == 200) {


         await signUpApi(context);

      } else {
        Get.snackbar("Error", "Something Went Wrong!!!");
      }
    });
  }

  Future verifyEmail(BuildContext context) async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyExists");
    await http.post(url, body: {
      'email': '${emailController.value.text.trim()}',
    }).then((value) {
      print(value.statusCode);
      if (value.statusCode == 200) {
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(value.body));
        if (res.responseCode == 200) {

        }
      } else {
        isEmailExist.value = true;
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(value.body));
        // Get.snackbar("Error", res.message.toString(),snackPosition: SnackPosition.TOP);
      }
    });
  }

  void verifyPhone(BuildContext context) async {
    var url = Uri.parse("https://api.waggs.in/api/v1/users/verifyExists");
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

  Future<void> sendotpApi() async {
    var url = Uri.parse(baseUrl3+ApiConstant.sendOtpUsers);
    var response = await http.post(url, body: {
      'mobile': '${mobileController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'email': '${emailController.value.text.trim()}',
    });
    if(response.statusCode == 200){
      Get.toNamed(Routes.O_T_P_SCREEN);
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<void> signUpApi(BuildContext context) async {
    var url = Uri.parse(baseUrl3+ApiConstant.signUpUsers);
    var response;
    await http.post(url, body: {
      'name': '${firstnameController.value.text.trim()}',
      'mobile': '${mobileController.value.text.trim()}',
      'countryCode': '${countryController.value.text.trim()}',
      'email': '${emailController.value.text.trim()}',
      'password': '${passController.value.text.trim()}'
    }).then((value) {
      print(value.body);
      response = value;
      if (response.statusCode == 200) {
        SignUpResponseModel res =
            SignUpResponseModel.fromJson(jsonDecode(response.body));
        showDialog(
            barrierDismissible: false,
            builder: (context) {
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
                    Text(
                      "Success",
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                content: Text(
                    "Sign up Successful. Check email for email verification."),
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
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN_SCREEN);
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(32, 193, 244, 1),
                        ),
                      ))
                ],
              );
            },
            context: context);
      }
      else{
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
        Get.snackbar("Error", res.message.toString());
      }
    }).catchError((error) {
      print(error);
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
