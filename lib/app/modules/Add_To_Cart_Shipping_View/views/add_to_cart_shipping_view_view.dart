import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_to_cart_shipping_view_controller.dart';

class AddToCartShippingViewView
    extends GetView<AddToCartShippingViewController> {
  const AddToCartShippingViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddToCartShippingViewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddToCartShippingViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
