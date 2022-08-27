import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/changed_password_send_otp_view_controller.dart';

class ChangedPasswordSendOtpViewView
    extends GetView<ChangedPasswordSendOtpViewController> {
  const ChangedPasswordSendOtpViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangedPasswordSendOtpViewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChangedPasswordSendOtpViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
