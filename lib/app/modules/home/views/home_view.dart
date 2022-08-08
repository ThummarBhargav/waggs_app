import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
            body: SingleChildScrollView(
              child: Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("Top Selling Store",
                        style: TextStyle(fontSize: 20, color: Colors.orange),),
                      GridView.builder(
                          itemCount: controller.UserList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage("${controller.UserList[index].images![0]}"),
                                    ),
                                  ),
                                ),
                                Container(
                                      child: Text("${controller.UserList[index].title}"),
                                ),
                                Container(
                                  child: Text("${controller.UserList[index].category}",
                                    style: TextStyle(fontSize: 10),),
                                ),
                                Container(
                                  child: Text("${controller.UserList[index].brand}",
                                    style: TextStyle(fontSize: 10),),
                                ),
                                Container(
                                  child: Text("DiscountPrice - ${controller.UserList[index].discountedPrice}",
                                    style: TextStyle(fontSize: 10),),
                                ),
                                Container(
                                  child: Text("Price - ${controller.UserList[index].price}",
                                    style: TextStyle(fontSize: 10),),
                                ),
                              ],
                            );
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10))
                    ],
                  ),
                ),
              ),
            )
        );
      }),
    );
  }
}
