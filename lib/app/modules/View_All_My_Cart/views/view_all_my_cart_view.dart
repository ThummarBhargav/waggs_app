import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/view_all_my_cart_controller.dart';

class ViewAllMyCartView extends GetView<ViewAllMyCartController> {
  const ViewAllMyCartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: ListView.builder(
                  itemCount: controller.cartProductList.length,
                  itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    height: 100,
                    child: Text("${controller.cartProductList[index].product!.title}"),
                  );
                },),
              )
            ],
          ),
        )
    );
  }
}
