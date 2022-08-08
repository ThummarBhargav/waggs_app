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
                              children: [
                                Container(
                                  height: 100,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage("${controller.UserList[index].images![0]}"))
                                  ),
                                ),
                                Container(
                                  child: Text("${controller.UserList[index].title}"),
                                ),
                                Container(
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
