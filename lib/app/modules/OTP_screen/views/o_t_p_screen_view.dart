import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/app/constant/text_field.dart';
import 'package:waggs_app/app/modules/singup_screen/controllers/singup_screen_controller.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

class OTPScreenView extends GetView<SingupScreenController> {
  const OTPScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(left: 28),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/otp1.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Enter verification code",
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("code was sent to Contact Number",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Colors.black45
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                width:350,
                child: getTextField(
                  textEditingController:
                  controller.otpController.value,
                  borderRadius: 20,
                  hintText: "OTP",
                  validator: (input) => !isNullEmptyOrFalse(input)
                      ? null
                      :"please enter otp ",
                ),
              ),
            ],
          ),
          SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  controller.otpApi();
                  controller.signUpApi();
                  Get.toNamed(Routes.LOGIN_SCREEN);
                },
                child: Container(
                  width: 180,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(80))
                  ),
                  child: Text("Verify",
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
