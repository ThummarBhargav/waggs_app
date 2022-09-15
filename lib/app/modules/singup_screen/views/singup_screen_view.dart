import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import '../controllers/singup_screen_controller.dart';

class SingupScreenView extends GetWidget<SingupScreenController> {
  const SingupScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/logo111.png")),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        "Create Account",
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "First Name",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
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
                        controller: controller.firstnameController.value,
                        keyboardType: TextInputType.name,
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "Please Enter Your First Name",
                        decoration: InputDecoration(
                          hintText: "Enter Your First Name",
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "Email Address",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
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
                      child: FocusScope(
                        onFocusChange: (val) {
                          controller.verifyEmail(context);
                        },
                        child: TextFormField(
                          controller: controller.emailController.value,
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) => !isNullEmptyOrFalse(input)
                              ? null
                              : "Please Enter Your Email Address",
                          decoration: InputDecoration(
                              hintText: "Enter Your Email Address",
                              hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorText: (controller.isEmailExist.isTrue)
                                  ? "Email already registered"
                                  : null),
                          onChanged: (val) {
                            controller.isEmailExist.value = false;
                          },
                          onFieldSubmitted: (val) {
                            controller.verifyEmail(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "Phone Number",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 15),
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
                              controller: controller.countryController.value,
                              keyboardType: TextInputType.phone,
                              validator: (input) => !isNullEmptyOrFalse(input)
                                  ? null
                                  : "Please Enter Your Country Code",
                              decoration: InputDecoration(
                                hintText: "+91",
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(
                                  10,
                                ),
                                //n is maximum number of characters you want in textfield
                              ],
                              controller: controller.mobileController.value,
                              validator: (input) => !isNullEmptyOrFalse(input)
                                  ? null
                                  : "Please Enter Your Phone Number",
                              decoration: InputDecoration(
                                  hintText: "Enter Your Phone Number",
                                  hintStyle: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorText: (controller.isNumberExist.isTrue)
                                      ? "Mobile number already registered"
                                      : null),
                              onChanged: (val) {
                                controller.isNumberExist.value = false;
                                if (val.length == 10) {
                                  controller.verifyPhone(context);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "Password",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
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
                          validator: (input) => !isNullEmptyOrFalse(input)
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            "Confirm Password",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
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
                          validator: (input) => !isNullEmptyOrFalse(input)
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
                          onChanged: (val) {
                            controller.ispass.value = false;
                          },
                          onFieldSubmitted: (val) {
                            if (controller.passController.value.text ==
                                controller.confirmPassController.value.text) {
                              controller.ispass.value = false;
                            } else {
                              controller.ispass.value = true;
                            }
                          },
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "By Registering, I Agree To",
                                style: GoogleFonts.roboto(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                const url =
                                    'https://waggs.in/terms-and-condition';
                                await launch(url);
                              },
                              child: Container(
                                child: Text(
                                  " Team Of Service",
                                  style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                " And ",
                                style: GoogleFonts.roboto(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                const url = 'https://waggs.in/privacy-policy';
                                await launch(url);
                              },
                              child: Container(
                                child: Text(
                                  "Privacy Policy",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.firstnameController.value.clear();
                            controller.passController.value.clear();
                            controller.mobileController.value.clear();
                            controller.confirmPassController.value.clear();
                            controller.emailController.value.clear();
                            controller.countryController.value.clear();
                            controller.verifyEmail(context).then((value) {
                              if (controller.formKey.currentState!.validate()) {
                                if (controller.isNumberExist.isFalse &&
                                    controller.isEmailExist.isFalse) {
                                  if (controller.passController.value.text ==
                                      controller
                                          .confirmPassController.value.text) {
                                    controller.sendotpApi();
                                  } else {
                                    controller.ispass.value = true;
                                  }
                                }
                              }
                            });
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
                            child: Text(
                              "Sign Up Now!",
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Already Have An Account? ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.LOGIN_SCREEN);
                          },
                          child: Container(
                            child: Text(
                              "Login Instead!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(32, 193, 244, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
