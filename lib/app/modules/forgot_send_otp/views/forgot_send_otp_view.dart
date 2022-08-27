import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/forgot_send_otp_controller.dart';

class ForgotSendOtpView extends GetView<ForgotSendOtpController> {
  const ForgotSendOtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo111.png",height: 100,width: 100),
              SizedBox(height: 15,),
              Text(
                "- VERIFY MOBILE",
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
                  "We have sent a 6-digit confirmation code to your mobile, please enter the code in below box to verify your mobile.",
                  style: GoogleFonts.roboto(
                      color: Color.fromRGBO(99, 115, 129, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                      child: TextFormField(
                        controller: controller.mobileController.value,
                        keyboardType: TextInputType.phone,
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "Please Enter otp",
                        decoration: InputDecoration(
                          hintText: "Enter otp",
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
                ],
              ),
              SizedBox(height: 25,),
              InkWell(
                onTap: () {
                  controller.verifyotp();
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
                  child: Text("verify",style: GoogleFonts.roboto(
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
    );
  }
}
