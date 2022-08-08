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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TextButton(onPressed: () {

                            }, child: Text("ACCESSORIES +")),
                            TextButton(onPressed: () {

                            }, child: Text("FOOD +")),
                            TextButton(onPressed: () {

                            }, child: Text("HEALTH & WELLNESS +")),
                            TextButton(onPressed: () {

                            }, child: Text("TREATS AND CHEWS +")),
                          ],
                        ),
                      ),
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
