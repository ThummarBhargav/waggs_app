import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: controller.formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    child: Text(" - CREATE ACCOUNT",
                      style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Enter otp sent to mobile no",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
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
                  controller: controller.otpController.value,
                  validator: (input) => !isNullEmptyOrFalse(input)
                      ? null
                      : "Please Enter Your Verification OTP",
                  decoration: InputDecoration(
                    hintText: "Enter OTP",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 22),
                    child: InkWell(
                      onTap: () {
                        if(controller.enableResend.value == true)
                        {
                          controller.secondsRemaining=30.obs;
                          controller.gettimer();
                          controller.refresh();
                          // controller.sendOtp();
                        }


                      },

                      child:Obx(()=>Text(controller.enableResend.value==true?"Resend Otp":"Resend Otp ${controller.secondsRemaining}",
                        style: GoogleFonts.raleway(
                            color:  controller.enableResend.value==true?Color.fromRGBO(32, 193, 244, 1):
                            Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      )),),
                  ),
                ],
              ),
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (controller.formKey2.currentState!.validate()) {
                        controller.otpApi(context);
                      }
                    },
                    child: Container(
                      width: 180,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(32, 193, 244, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )
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
