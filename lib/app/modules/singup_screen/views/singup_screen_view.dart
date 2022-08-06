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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CREATE ACCOUNT',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: getTextField(
                        textEditingController:
                        controller.firstnameController.value,
                        borderRadius: 20,
                        hintText: "First Name",
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "please Enter your name",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15),
                          child: Image(
                            image: AssetImage("assets/8888.png"),
                            height: 20,
                            width: 20,
                            // height: ,
                            // width: MySize.size25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: getTextField(
                        textEditingController:
                        controller.emailController.value,
                        borderRadius: 20,
                        hintText: "Email Address",
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "please Enter your Email",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15),
                          child: Image(
                            image: AssetImage("assets/ic_mail.png"),
                            height: 20,
                            width: 20,
                            // height: ,
                            // width: MySize.size25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          width:100,
                          child: getTextField(
                            textEditingController:
                            controller.countryController.value,
                            borderRadius: 20,
                            hintText: "+91",
                            validator: (input) => !isNullEmptyOrFalse(input)
                                ? null
                                :"Contry code",
                          ),
                        ),
                      ),
                      SizedBox(),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 20,
                          ),
                          width:230,
                          child: getTextField(
                            textEditingController:
                            controller.mobileController.value,
                            borderRadius: 20,
                            hintText: "Mobile Number",
                            validator: (input) => !isNullEmptyOrFalse(input)
                                ? null
                                : "please Enter your Mobile number",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image(
                                image: AssetImage("assets/88.png"),
                                height: 20,
                                width: 20,
                                // height: ,
                                // width: MySize.size25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                      ),
                    );
                  }),
                  SizedBox(),
                  Obx(() {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),

                        child: getTextField(
                          textEditingController:
                          controller.confirmPassController.value,
                          borderRadius: 20,
                          hintText: "Conform Password",
                          validator: (input) => !isNullEmptyOrFalse(input)
                              ? null
                              : "Please Enter Conform Password",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(15),
                            child: Image(
                              image: AssetImage("assets/ic_lock.png"),
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      Get.toNamed(Routes.O_T_P_SCREEN);
                      await controller.sendotpApi();
                    }
                  }, child: Text("SING UP")),
                  SizedBox(height: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(color: Colors.black),),
                      TextButton(onPressed: () {
                        Get.toNamed(Routes.LOGIN_SCREEN);
                      }, child: Text("LOG IN",style: TextStyle(color: Colors.blue,fontSize:15),))
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
