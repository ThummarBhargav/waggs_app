import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../Modal/Forget_passwordmodel.dart';
import '../../../Modal/OrderDetailModel.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

import '../../order_page/controllers/order_page_controller.dart';

class OrderDetailController extends GetxController {
  String? orderId;
  RxBool hasData = false.obs;
  OrderDetailModel? orderDetailModel;
  OrderPageController? orderPageController;
  RxList<String>? listOfPassedStatus;
  RxDouble initialRating = 0.0.obs;
  bool isVertical = false;
  RxDouble rating = 0.0.obs;
  @override
  void onInit() {
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

  Future<void> disputeOrder(String status) async {
    var url = Uri.parse(baseUrl + ApiConstant.orderCancel + orderId!);
    var response;
    await http.put(url, body: {
      'status': status,
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
    if (orderDetailModel!.data!.status == "PENDING") {
      listOfPassedStatus = [""].obs;
    } else if (orderDetailModel!.data!.status == "ACCEPTED") {
      listOfPassedStatus = ["PENDING"].obs;
    } else if (orderDetailModel!.data!.status == "PROCESSING") {
      listOfPassedStatus = ["PENDING", "ACCEPTED"].obs;
    } else if (orderDetailModel!.data!.status == "DISPATCHED") {
      listOfPassedStatus = ["PENDING", "ACCEPTED", "PROCESSING"].obs;
    } else if (orderDetailModel!.data!.status == "DELIVERED") {
      listOfPassedStatus =
          ["PENDING", "ACCEPTED", "PROCESSING", "DISPATCHED"].obs;
    } else if (orderDetailModel!.data!.status == "COMPLETED") {
      listOfPassedStatus =
          ["PENDING", "ACCEPTED", "PROCESSING", "DISPATCHED", "DELIVERED"].obs;
    } else {
      listOfPassedStatus = [""].obs;
    }
  }

  dialogBox({String? message, String? status, required BuildContext context}) {
    Widget cancelButton = InkWell(
      child: Text(
        "No  ",
        style: TextStyle(
          color: Color(0xff20C1F4),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Get.back();
      },
    );
    Widget continueButton = InkWell(
      child: Text(
        "Yes     ",
        style: TextStyle(
          color: Color(0xff20C1F4),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Get.back();
        disputeOrder(status!);
      },
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            message!,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          actions: [
            continueButton,
            cancelButton,
          ],
        );
      },
    );
  }

  ratingApi() async {
    var URl = baseUrl + "order/${orderId}";
    Dio dio = Dio();
    Options option = Options(headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    var response;
    await dio
        .put(
      URl,
      data: {
        "rating": rating.value,
      },
      options: option,
    )
        .then((value) {
      response = value;
      if (response.statusCode == 200 || response.statusCode == 201) {
        getOrderDetails();
        // Get.back();
        print(response.data);
      } else if (response.statusCode == 400) {
      } else {}
    }).catchError((error) {
      DioError err = error as DioError;
      print("Error:==== ${err.response}");
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
