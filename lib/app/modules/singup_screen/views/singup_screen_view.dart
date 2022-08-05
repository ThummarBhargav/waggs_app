import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/singup_screen_controller.dart';

class SingupScreenView extends GetView<SingupScreenController> {
  const SingupScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("CREATE ACCOUNT",
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            
          ],
        ),
      )
    );
  }
}
