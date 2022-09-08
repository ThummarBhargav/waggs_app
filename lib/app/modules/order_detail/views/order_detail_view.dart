import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetWidget<OrderDetailController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
