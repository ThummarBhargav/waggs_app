import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';

import '../controllers/forgot_new_password_controller.dart';

class ForgotNewPasswordView extends GetWidget<ForgotNewPasswordController> {
  const ForgotNewPasswordView({Key? key}) : super(key: key);
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
                  Image.asset("assets/logo111.png",height: 150,width: 150),
                  SizedBox(height: 15,),
                  Text(
                    "- CHANGE PASSWORD",
                    style: GoogleFonts.roboto(
                        color: Color.fromRGBO(242, 160, 87, 1),
                        height: 1.5,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Enter new password",
                      style: GoogleFonts.roboto(
                          color: Color.fromRGBO(99, 115, 129, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15,),
                        child: Text("Password", style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: controller.passController.value,
                        validator: (input) =>
                        !isNullEmptyOrFalse(input)
                            ? null
                            : "Please Enter Password",
                        obscureText: controller.passwordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.passwordVisible.toggle();
                                },
                                icon: (!controller.passwordVisible.value)
                                    ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                                    : Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ))),
                      ),
                    );
                  }),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15,),
                        child: Text(
                          "Confirm Password", style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Obx(() {
                    return Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: TextFormField(
                        controller: controller.confirmPassController.value,
                        validator: (input) =>
                        !isNullEmptyOrFalse(input)
                            ? null
                            : "Please Confirm Enter Password",
                        obscureText: controller.passwordVisible.value,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: "Enter Your Confirm Password",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorText: (controller.ispass.isTrue)
                                ? "Does not match password"
                                : null,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.passwordVisible.toggle();
                                },
                                icon: (!controller.passwordVisible.value)
                                    ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                                    : Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ))),
                        onChanged: (val){
                          controller.ispass.value = false;
                        },
                        onFieldSubmitted: (val){
                          if(controller.passController.value.text == controller.confirmPassController.value.text)
                          {
                            controller.ispass.value = false;
                          }
                          else
                          {
                            controller.ispass.value =true;
                          }
                        },
                      ),
                    );
                  }),
                  SizedBox(height: 20,),
                  SizedBox(height: 25,),
                  InkWell(
                    onTap: () {
                      if(controller.formKey.currentState!.validate()) {
                        if(controller.passController.value.text == controller.confirmPassController.value.text)
                        {
                          controller.NewPassword();
                        }else
                        {

                        }
                      }
                    },
                    child: Container(
                      width: 180,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xffDE8701),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Text("Submit",style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),),
                    ),
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
