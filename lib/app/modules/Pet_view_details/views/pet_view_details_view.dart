import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pet_view_details_controller.dart';

class PetViewDetailsView extends GetWidget<PetViewDetailsController> {
  const PetViewDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PetViewDetailsView'),
          centerTitle: true,
        ),
        body: Container(
          height: 100,
          width: 100,
          child: Text("${controller.petData.user}"),
        ));
  }
}
