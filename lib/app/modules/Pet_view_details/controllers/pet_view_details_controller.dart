import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:waggs_app/app/Modal/AllPetModel.dart';
import 'package:waggs_app/app/Modal/PetModel.dart';
import 'package:waggs_app/app/Modal/view_pet_details.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/main.dart';

class PetViewDetailsController extends GetxController {
  //TODO: Implement PetViewDetailsController
  RxBool hasData = false.obs;
  RefreshController refreshController = RefreshController();
  pet1 pet11 = pet1();
  RxList<pet1> petview = RxList<pet1>([]);
  @override
  void onInit() {
    var Data1= Get.arguments;
    MyPet(context: Get.context!);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  MyPet({required BuildContext context, bool isFromLoading = false}) async {
    var url = Uri.parse(
        baseUrl + ApiConstant.getpet +"${Get.arguments}");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData.value = true;
    if (response.statusCode == 200) {
      pet1 res = pet1.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data)) {
              petview.add(pet11);
            if (isFromLoading) {
              refreshController.loadComplete();
            }

        }
      }
    }
  }

}
