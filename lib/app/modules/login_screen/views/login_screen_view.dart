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
        body: Center(
          child: Container(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      // width:1000,
                      child: getTextField(
                        textEditingController: controller.emailController.value,
                        borderRadius: 20,
                        hintText: "Username",
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "Check your email",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15),
                          child: Image(
                            image: AssetImage("assets/ic_mail.png"),
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Obx(() {
                      return Container(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: getTextField(
                          textEditingController:
                              controller.passController.value,
                          borderRadius: 20,
                          hintText: "Password",
                          validator: (input) => !isNullEmptyOrFalse(input)
                              ? null
                              : "Please Enter Password",
                          textVisible: controller.passwordVisible.value,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage("assets/ic_lock.png"),
                              height: 25,
                              width: 25,
                            ),
                          ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.LoginUser();
                          }
                        },
                        child: Text("LOGIN"),
                      ),
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
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Get.offAndToNamed(Routes.SINGUP_SCREEN);
                        },
                        child: const Text(' Sign Up'),
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
