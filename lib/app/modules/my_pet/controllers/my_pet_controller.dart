import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:waggs_app/app/Modal/AllPetModel.dart';
import '../../../../main.dart';
import '../../../Modal/CartCountModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class MyPetController extends GetxController {
  RefreshController refreshController = RefreshController();
  RxList<Pets> allPetList = RxList<Pets>([]);
  RxBool hasData = false.obs;
  RxInt itemCount = 0.obs;
  Count1 count1 = Count1();
  RxList<Count1> Countlist = RxList<Count1>([]);
  @override
  void onInit() {
    getAllPet(context: Get.context!);
    CartCount();
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

  getAllPet({required BuildContext context, bool isFromLoading = false}) async {
    var url = Uri.parse(
        baseUrl + ApiConstant.getpet + "list?skip=${itemCount.value}&limit=20");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData.value = true;
    if (response.statusCode == 200) {
      PetListModel res = PetListModel.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data)) {
          if (!isNullEmptyOrFalse(res.data!.pets)) {
            res.data!.pets!.forEach((element) {
              allPetList.add(element);
            });
            itemCount.value = allPetList.length;
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

  CartCount() async {
    Countlist.clear();
    var url = Uri.parse(baseUrl + ApiConstant.Count);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    print('response status:${response.body}');
    dynamic result = jsonDecode(response.body);
    count1 = Count1.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(count1.data)) {
      Countlist.add(count1);
    }
    Countlist.refresh();
  }
}
