import 'dart:convert';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../Modal/Forget_passwordmodel.dart';
import '../../../Modal/OrderDetailModel.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

import '../../order_page/controllers/order_page_controller.dart';

class OrderDetailController extends GetxController {
  final count = 0.obs;
  String? orderId;
  RxBool hasData = false.obs;
  OrderDetailModel? orderDetailModel;
  OrderPageController? orderPageController;
  @override
  void onInit() {
    // super.onInit();
    // Get.lazyPut(OrderDetailController());
    orderPageController = Get.find<OrderPageController>();
    if (Get.arguments != null) {
      orderId = Get.arguments[ArgumentConstant.orderId];
      getOrderDetails();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> cancelOrder() async {
    var url = Uri.parse(baseUrl + ApiConstant.orderCancel + orderId!);
    var response;
    await http.put(url, body: {
      'status': 'CANCELED',
    }, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      // 'Content-Type': 'application/json'
    }).then((value) {
      FpassModel res = FpassModel.fromJson(jsonDecode(value.body));

      if (value.statusCode == 200) {
        Get.snackbar("Success", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));

        getOrderDetails();
        orderPageController!.Allorder();
      } else {
        Get.snackbar("Success", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
      print('Response status: ${value.statusCode}');
      print('Response body: ${value.body}');
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> disputeOrder() async {
    var url = Uri.parse(baseUrl + ApiConstant.orderCancel + orderId!);
    var response;
    await http.put(url, body: {
      'status': 'DISPUTED',
    }, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      // 'Content-Type': 'application/json'
    }).then((value) {
      FpassModel res = FpassModel.fromJson(jsonDecode(value.body));

      if (value.statusCode == 200) {
        Get.snackbar("Success", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));
        orderPageController!.Allorder();

        getOrderDetails();
      } else {
        Get.snackbar("Success", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));
      }
      print('Response status: ${value.statusCode}');
      print('Response body: ${value.body}');
    }).catchError((error) {
      print(error);
    });
  }

  getOrderDetails() async {
    hasData.value = false;

    var url = Uri.parse(baseUrl + ApiConstant.orderDetail + orderId!);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json'
    });
    hasData.value = true;
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    orderDetailModel = OrderDetailModel.fromJson(result);
    // if (!isNullEmptyOrFalse(bannerModel.data)) {
    //   bannerModel.data!.forEach((element) {
    //     bannerList.add(element);
    //   }
    //   );
    //   getAllUserApi();
    // }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
