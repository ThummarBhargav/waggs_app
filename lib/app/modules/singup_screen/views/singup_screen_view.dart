import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/app/constant/text_field.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import '../controllers/singup_screen_controller.dart';

class SingupScreenView extends GetView<SingupScreenController> {
  const SingupScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Image.asset(
                  "assets/logo111.png",
                  width: 100,
                  height: 100,
                ),
                Text(
                  "Create Account",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "First Name",
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
                    color: Colors.grey[100],
                    child: getTextField(
                      textEditingController: controller.firstnameController.value,
                      hintText: "Enter Your First Name",
                      validator: (input) => !isNullEmptyOrFalse(input)
                          ? null
                          : "Enter Your First Name",
                    ),
                  ),
                ),
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
                    color: Colors.grey[100],
                    child: getTextField(
                      textEditingController: controller.emailController.value,
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
                      "Phone Number",
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
                    color: Colors.grey[100],
                    child: getTextField(
                      textEditingController: controller.mobileController.value,
                      hintText: "Enter Your Phone Number",
                      validator: (input) => !isNullEmptyOrFalse(input)
                          ? null
                          : "Enter your Phone Number",
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
                      color: Colors.grey[100],
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirm Password",
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
                        hintText: "Confirm Password",
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "Please Enter Confirm Password",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By registering, I agree to",
                      style: GoogleFonts.roboto(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                      },
                      child: const Text('Terms of Service',style: TextStyle(color: Colors.black),),
                    ),
                    Text(
                      "and",
                      style: GoogleFonts.roboto(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                      },
                      child: const Text('Privacy Policy',style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 40,left: 40),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight:Radius.circular(30),bottomLeft: Radius.circular(30) )),
                  child: TextButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                      }
                    },
                    child: Text("Sing Up Now!",style: TextStyle(fontSize:15,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                      child: const Text('Login instead!'),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
