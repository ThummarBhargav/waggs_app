import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import '../../../constant/sizeConstant.dart';
import '../../../constant/text_field.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  SizedBox sizedBox = SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "assets/logo111.png",
                    width: 100,
                    height: 100,
                  ),
                  // sliverBox,
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    " LOGIN TO YOUR ACCOUNT",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: getTextField(
                        textEditingController: controller.emailController.value,
                        // borderRadius: 20,
                        hintText: "Enter Your Email",
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "Check your email",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Obx(() {
                      return Container(
                        child: getTextField(
                          textEditingController:
                              controller.passController.value,
                          // borderRadius: 20,
                          hintText: "Password",
                          validator: (input) => !isNullEmptyOrFalse(input)
                              ? null
                              : "Please Enter Password",
                          textVisible: controller.passwordVisible.value,

                          suffixIcon: InkWell(
                            onTap: () {
                              controller.passwordVisible.toggle();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image(
                                image: AssetImage(
                                    (!controller.passwordVisible.value)
                                        ? "assets/ic_eye_offf.png"
                                        : "assets/ic_eye.png"),
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Lost Your Password?",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 40,left: 40),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight:Radius.circular(30),bottomLeft: Radius.circular(30) )),
                    child: TextButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.LoginUser();
                        }
                      },
                      child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Get.offAndToNamed(Routes.SINGUP_SCREEN);
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
