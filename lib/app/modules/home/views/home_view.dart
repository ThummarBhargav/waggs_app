import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 700,
            width: double.infinity,
            child: Column(
              children: [
                  Text("Top Selling Store",style: TextStyle(fontSize:20,color: Colors.orange),),
                GridView.builder(
                  itemCount: controller.UserList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 50,
                    child: Text("${controller.UserList[index].title}"),
                  );
                },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
              ],
            ),
          ),
        )
      ),
    );
  }
}
