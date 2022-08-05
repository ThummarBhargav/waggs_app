import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/o_t_p_screen_controller.dart';

class OTPScreenView extends GetView<OTPScreenController> {
  const OTPScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTPScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OTPScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
