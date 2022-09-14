import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:waggs_app/app/Modal/PetModel.dart';
import 'package:waggs_app/app/Modal/PlanModel.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/SubscriptionModel.dart';
import '../../../../main.dart';
import '../../../Modal/ErrorResponse.dart';
import '../../../Modal/PlanModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import '../../../routes/app_pages.dart';

class PlaneController extends GetxController {
  PlanModel planModel = PlanModel();
  subscriprion subscriptions = subscriprion();
  Transaction? transactionList;
  RxList<PlanData> planList = RxList<PlanData>([]);
  List respons = [];
  List respons1 = [];
  PetModel petModel = PetModel();
  Data1? data;
  static const platform = const MethodChannel("razorpay_flutter");
  late Razorpay _razorpay;
  RxBool isFromDrawer = false.obs;
  RxBool isDataAccepted = false.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      isFromDrawer.value = Get.arguments[ArgumentConstant.isFromDrawer];
      isDataAccepted.value = true;
    }
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
    _razorpay.clear();
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
      });
    }
  }

  Future<void> PayMent({required PlanData data}) async {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    if ((box.read(ArgumentConstant.isUserLogin) == null)) {
      Get.toNamed(Routes.LOGIN_SCREEN);
    } else {
      print('Bearer ${box.read(ArgumentConstant.token)}');
      var url = Uri.parse(baseUrl + ApiConstant.PlansPlayment);
      var response;
      await http.post(url, body: {
        'planId': '${data.id}',
        'amount': '${data.amount}'
      }, headers: {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      }).then((value) {
        response = value;
      });
      respons.add(response.body);
      print(jsonDecode(response.body).runtimeType);
      dynamic result = jsonDecode(response.body);
      subscriptions = subscriprion.fromJson(result);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        transactionList = subscriptions.data!.transaction;
        var options = {
          "key": "${ApiConstant.paymentKey}",
          "amount": data.amount!.toInt() * 100,
          "name": "Waggs",
          "description": data.name.toString(),
          "order_id": "${subscriptions.data!.order!.id}",
          "timeout": "180",
          "currency": "INR",
          'send_sms_hash': true,
          "prefill": {
            "contact": "${box.read(ArgumentConstant.phone)}",
            "email": "${box.read(ArgumentConstant.email)}"
          },
          "external": {
            "wallets": ["paytm"]
          }
        };
        try {
          _razorpay.open(options);
        } catch (e) {
          print(e.toString());
        }
      } else {
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
        Get.snackbar("Error", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  updateTrans(String paymentId, String OrderId, String Signature) async {
    Dio dio = Dio();
    Options option = Options(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    try {
      var response = await dio.put(
        baseUrl +
            ApiConstant.transcation +
            "/${subscriptions.data!.transaction!.sId}",
        data: {
          "paymentDetails": {
            "paymentId": "${paymentId}",
            "orderId": "${OrderId}",
            "signature": "${Signature}"
          }
        },
        options: option,
      );
      print("UPDATE=========>" + response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // print(jsonDecode(response.data).runtimeType);
        // dynamic result = jsonDecode(response.data);
        // print('${result}');
        petModel = PetModel.fromJson(response.data);
        data = petModel.data;
        print('petid=====${petModel.data!.pet}');
        print('petid=====${data!.pet}');
        String petId = "";
        if (!isNullEmptyOrFalse(petModel.data)) {
          if (!isNullEmptyOrFalse(petModel.data!.pet)) {
            petId = petModel.data!.pet!;
          }
        }
        Get.toNamed(Routes.ADD_PET, arguments: {
          ArgumentConstant.patId: petId,
        });
      } else if (response.statusCode == 400) {
      } else {}
    } on SocketException {}
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    updateTrans(response.paymentId.toString(), response.orderId.toString(),
        response.signature.toString());
    Get.snackbar("Success", "Payment Done",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
  }
}
