import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_to_cart_shipping_view_controller.dart';

class AddToCartShippingViewView
    extends GetView<AddToCartShippingViewController> {
  const AddToCartShippingViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
            actions: [
              IconButton(onPressed: () {

              }, icon: Icon(Icons.search,color: Colors.black,)),
              // IconButton(onPressed: () {
              //
              // }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,)),
            ],
          ),
          body: Container(),
        )
    );
  }
}
