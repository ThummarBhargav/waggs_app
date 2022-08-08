import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
              Text("Top Selling Store",style: TextStyle(color: Colors.orange),),
            GridView.builder(
              itemCount: controller.UserList.length,
                itemBuilder: (context, index) {
              return Container(

              );
            },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
          ],
        )
      ),
    );
  }
}
