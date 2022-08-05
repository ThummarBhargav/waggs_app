import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/text_field.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {

  SizedBox sizedBox = SizedBox(height: 10,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginScreenView'),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(" LOGIN TO YOUR ACCOUNT",
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
            sizedBox,
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              width:1000,
              child: getTextField(
                textEditingController:
                controller.emailController.value,
                borderRadius: 20,
                hintText: "Username",
                // validator: (input) => !isNullEmptyOrFalse(input)
                //     ? null
                //     : "Check your email",
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

          ],
        ),
      )
    );
  }
}
