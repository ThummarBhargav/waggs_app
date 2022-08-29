import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/PlanModel.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/PlanModel.dart';
import '../../../Modal/PlanModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class PlaneController extends GetxController {

  PlanModel planModel =  PlanModel();
  RxList<PlanData> planList = RxList<PlanData>([]);

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
    AllPlans();
    super.onInit();
    });
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


}
