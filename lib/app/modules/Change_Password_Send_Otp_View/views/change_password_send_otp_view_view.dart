import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_send_otp_view_controller.dart';

class ChangePasswordSendOtpViewView
    extends GetView<ChangePasswordSendOtpViewController> {
  const ChangePasswordSendOtpViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(onPressed: () {
              
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
          ),
    ));
  }
}
