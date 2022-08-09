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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(
                            "assets/logo111.png"
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text("Create Account",style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,),
                      child: Text("First Name",style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 15,),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: controller.firstnameController.value,
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
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,),
                      child: Text("Phone Number",style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 15,),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: controller.mobileController.value,
                    decoration: InputDecoration(
                      hintText: "Enter Your Phone Number",
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,),
                      child: Text("Password",style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 15,),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: controller.passController.value,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,),
                      child: Text("Confirm Password",style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.only(left: 15,),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: controller.confirmPassController.value,
                    decoration: InputDecoration(
                      hintText: "Enter Your Confirm Password",
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("By Registering, I Agree To",
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: Colors.grey
                        ),),
                    ),
                    Container(
                      child: Text(" Team Of Service",
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),),
                    ),
                    Container(
                      child: Text(" And ",
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: Colors.grey
                        ),),
                    ),
                    Container(
                      child: Text("Privacy Policy",
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {

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
                        child: Text("Sign Up Now!",style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Already Have An Account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN_SCREEN);
                      },
                      child: Container(
                        child: Text("Login Instead!",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.cyan
                          ),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
