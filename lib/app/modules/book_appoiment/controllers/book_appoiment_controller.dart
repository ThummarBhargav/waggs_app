import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../main.dart';
import '../../../Modal/AllVetModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
class BookAppoimentController extends GetxController {

  RefreshController refreshController = RefreshController();
  RxInt itemCount = 0.obs;
  RxBool hasData = false.obs;
  RxList<Vets> vetList = RxList<Vets>([]);
  String petid = Get.arguments;

  @override
  void onInit() {
    getAllVet(context: Get.context!);
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
  // find?skip=0&limit=15
  getAllVet({required BuildContext context, bool isFromLoading = false}) async {
    var url = Uri.parse(
        baseUrl + ApiConstant.getvet + "/find?skip=${itemCount.value}&limit=15");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData.value=true;
    if (response.statusCode == 200) {
      AllvetModel res = AllvetModel.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data)) {
          if (!isNullEmptyOrFalse(res.data!.vets)) {
            print('data:${res.data!.vets}');
            res.data!.vets!.forEach((element) {
              vetList.add(element);
            });
            itemCount.value = vetList.length;
            if (isFromLoading) {
              refreshController.loadComplete();
            }
          }
        }
      }
    } else {
      refreshController.loadComplete();
    }

    }
  }

