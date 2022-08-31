  import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:waggs_app/app/Modal/PetModel.dart';
import 'package:waggs_app/app/Modal/PlanModel.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/SubscriptionModel.dart';
import '../../../../main.dart';
import '../../../Modal/PlanModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import '../../../routes/app_pages.dart';

class PlaneController extends GetxController {

  PlanModel planModel =  PlanModel();
  subscriprion subscriptions = subscriprion();
  Transaction? transactionList;
  RxList<PlanData> planList = RxList<PlanData>([]);
List respons=[];


  static const platform = const MethodChannel("razorpay_flutter");
  late Razorpay _razorpay;
  @override
  void onInit() {
    AllPlans();
    super.onInit();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,  _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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
      }
      );
    }
  }

  Future<void> PayMent({required PlanData data}) async {
    if((box.read(ArgumentConstant.isUserLogin) == null)){
      Get.toNamed(Routes.LOGIN_SCREEN);
    }
    else
      {
      print('Bearer ${box.read(ArgumentConstant.token)}');
      try {
        var url = Uri.parse(baseUrl + ApiConstant.PlansPlayment);
        var response;
        await http.post(url, body: {
          'planId': '${data.id}',
          'amount': '${data.amount}'
        }, headers: {
          'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        }
        ).then((value) {
          response = value;
        });
        respons.add(response.body);
        print(jsonDecode(response.body).runtimeType);
        dynamic result = jsonDecode(response.body);
        subscriptions = subscriprion.fromJson(result);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        if (response.statusCode == 200) {
            transactionList=subscriptions.data!.transaction;
          var options = {
            "key": "rzp_test_Ad3xOmLFP1EkRf",
            "amount": data.amount!.toInt() * 100,
            "name": "Waggs Payment",
            "description": data.name.toString(),
            "timeout": "180",
            "currency": "INR",
            'send_sms_hash': true,
            "prefill": {"contact": "${box.read(ArgumentConstant.phone)}", "email": "${box.read(ArgumentConstant.email)}"},
            "external": {
              "wallets": ["paytm"]
            }
          };
          try {
            _razorpay.open(options);
          } catch (e) {
            print(e.toString());
          }
        }
        // Get.snackbar("Success","Payment Done",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green);
       // else{
       //    Get.snackbar("Error", "Payment Not Done",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.orangeAccent);
       //  }
      }catch(e){
        Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.orangeAccent);
      }
    }
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    Get.snackbar("Success","Payment Done",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green);
    print("Id===>${transactionList!.sId}");
    Get.toNamed(Routes.ADD_PET,arguments: transactionList!.sId);
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

}

