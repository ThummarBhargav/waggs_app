import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/constant/text_field.dart';
import 'package:waggs_app/app/modules/singup_screen/controllers/singup_screen_controller.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
class EmailScreenView extends GetView<SingupScreenController> {
  const EmailScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
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
                  child: Text("Enter verification Email",
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
                  child: Text("Verification Token sent Your Email Address",
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
                    controller.emailvController.value,
                    // borderRadius: 20,
                    hintText: "Email Verification",
                    validator: (input) => !isNullEmptyOrFalse(input)
                        ? null
                        :"please enter Email verification Token",
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
                    if (controller.formKey.currentState!.validate()) {
                      controller.otpApi();
                      // Get.defaultDialog(
                      //     title: "VERIFICATION",
                      //     titleStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      //     middleText: "Verify your Account",
                      //     middleTextStyle:  TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                      //     backgroundColor: Colors.blue[200],
                      //     radius: 50,
                      //     textConfirm: "Confirm",
                      //     confirmTextColor: Colors.indigo,
                      //     onConfirm: (){
                      //       controller.signUpApi();
                      //       Get.toNamed(Routes.LOGIN_SCREEN);
                      //     },
                      //     barrierDismissible: false
                      // );
                    }
                  },
                  child: Container(
                    width: 180,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
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
      ),
    );
  }
}
