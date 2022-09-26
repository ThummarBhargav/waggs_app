import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/OrderModel.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';

import '../../../../main.dart';

class OrderPageController extends GetxController {
  Orders1 order = Orders1();
  List<Map<String, dynamic>> orderData = [];
  Orders1 orders1 = Orders1();
  RxList<Orders1> OrderList = RxList<Orders1>([]);
  RxBool hasData = false.obs;

  @override
  void onInit() {
    orderData.clear();
    Allorder();

    super.onInit();
  }

  Future<void> Allorder() async {
    hasData.value = false;
    orderData = [];
    OrderList.clear();
    var url = Uri.parse(baseUrl + ApiConstant.orderlist);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });

    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    orders1 = Orders1.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(orders1.data)) {
      OrderList.add(orders1);

      print(OrderList);

      if (!isNullEmptyOrFalse(OrderList)) {
        if (!isNullEmptyOrFalse(OrderList[0].data)) {
          if (!isNullEmptyOrFalse(OrderList[0].data!.orderDetails)) {
            OrderList[0].data!.orderDetails!.forEach((element) {
              Map<String, dynamic> dict = {};
              dict["GroupBy"] = element.orderNo! + "_" + element.createdAt!;
              dict["OrderData"] = element;
              print(element.createdAt!);
              orderData.add(dict);
            });
          }
        }
        print(orderData);
        // Get.toNamed(Routes.ORDER_PAGE,arguments: {
        //   ArgumentConstant.orderData : orderData,
        // });
      }
    } else {}
    hasData.value = true;
    OrderList.refresh();
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
