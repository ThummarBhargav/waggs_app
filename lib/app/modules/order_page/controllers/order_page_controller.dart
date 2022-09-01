import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/OrderModel.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';

class OrderPageController extends GetxController {
  Orders1 order = Orders1();
  RxList<Orders1> OrderList = RxList<Orders1>([]);


  @override
  void onInit() {
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

  // Allorder() async {
  //   var url = Uri.parse(baseUrl+ApiConstant.orderlist);
  //   var response = await http.get(url);
  //   print('response status:${response.request}');
  //   dynamic result = jsonDecode(response.body);
  //   orders1 = Orders1.fromJson(result);
  //   print(result);
  //   if (!isNullEmptyOrFalse(orders1)) {
  //     OrderList.add(order);
  //   }
  // }
}
