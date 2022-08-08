import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waggs_app/app/modules/view-product/views/view_product_view.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/waggs.png',
                      width: 100,
                      height: 60,
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.cyan,
                      child: Row(
                        children: List.generate(controller.Category.length, (index) {
                          return Row(
                            children: [
                            TextButton(
                                  onPressed: () {
                                    controller.categoryId[index];
                                    print(controller.categoryId[index]);
                                  },
                                  child: Text(
                                    controller.Category[index]+" +",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          );
                        }),
                        // children: [
                        //   TextButton(
                        //       onPressed: () {
                        //
                        //       },
                        //       child: Text(
                        //         "ACCESSORIES +",
                        //         style: TextStyle(color: Colors.white),
                        //       )),
                        //   TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         "FOOD +",
                        //         style: TextStyle(color: Colors.white),
                        //       )),
                        //   TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         "HEALTH & WELLNESS +",
                        //         style: TextStyle(color: Colors.white),
                        //       )),
                        //   TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         "TREATS AND CHEWS +",
                        //         style: TextStyle(color: Colors.white),
                        //       )),
                        // ],
                      ),
                    ),
                  ),
                  GridView.builder(
                      itemCount: controller.UserList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to(ViewProductView(index));
                            // print("sdasdasd");
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${controller.UserList[index].images![0]}"))),
                              ),
                              Container(
                                child:
                                    Text("${controller.UserList[index].title}"),
                              ),
                              Container(),

                            ],
                          ),
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
        ));
      }),
    );
  }
}
