  import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/PlanModel.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/PlanModel.dart';
import '../../../../main.dart';
import '../../../Modal/PlanModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import '../../../routes/app_pages.dart';

class PlaneController extends GetxController {

  PlanModel planModel =  PlanModel();
  RxList<PlanData> planList = RxList<PlanData>([]);
List respons=[];
  @override
  void onInit() {
    AllPlans();
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

  AllPlans() async {
    var url = Uri.parse(baseUrl + ApiConstant.Plans);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    planModel = PlanModel.fromJson(result);
    if (!isNullEmptyOrFalse(planModel.data)) {
      planModel.data!.forEach((element) {
        planList.add(element);
      }
      );
    }
  }

  Future<void> PayMent({required PlanData data}) async {
    if((box.read(ArgumentConstant.isUserLogin) == null)){
      Get.toNamed(Routes.LOGIN_SCREEN);
    }else{
      print('Bearer ${box.read(ArgumentConstant.token)}');
      try{
        var url = Uri.parse(baseUrl+ApiConstant.PlansPlayment);
        var response ;
        await http.post(url, body: {
          'planId': '${data.id}',
          'amount': '${data.amount}'
        },headers: {
          'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        }
        ).then((value) {
           response = value;
        });
        respons.add(response.body);
        print(jsonDecode(response.body).runtimeType);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        if(response.statusCode==200){
          Get.snackbar("Success","Payment Done",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green);
        }
        else{
          Get.snackbar("Error", "Payment Not Done",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.orangeAccent);
        }
      }catch(e){
        Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.orangeAccent);
      }
    }
  }

}
