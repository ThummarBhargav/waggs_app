import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/OrderModel.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';

class OrderPageController extends GetxController {
  Order order = Order();
  RxList<Order> OrderList = RxList<Order>([]);


  @override
  void onInit() {
    Allorder();
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

  Allorder() async {
    var url = Uri.parse(baseUrl+ApiConstant.orderlist);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    order = Order.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(order)) {
      OrderList.add(order);
    }
  }
}
