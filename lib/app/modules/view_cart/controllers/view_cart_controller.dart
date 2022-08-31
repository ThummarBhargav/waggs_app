import 'package:get/get.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:waggs_app/app/Modal/ErrorResponse.dart';
import 'package:waggs_app/app/Modal/checkoutModel.dart';
import '../../../../main.dart';
import '../../../Modal/CartCountModel.dart';
import '../../../Modal/CartProductModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import 'package:http/http.dart' as http;

class ViewCartController extends GetxController  {
  RxBool hasData = false.obs;
  RxList<Details> cartProductList = RxList<Details>([]);
  CartProduct cartProduct =CartProduct();
  Count1 count1 = Count1();
  RxList<Count1> Countlist = RxList<Count1>([]);
  Checkout checkout = Checkout();
  Order? Checkoutlist;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> apartmentController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> couponController = TextEditingController().obs;
  RxBool emailVisible = true.obs;
  RxBool nameVisible = true.obs;
  RxBool emailCheckBox = false.obs;
  RxBool detailCheckBox = false.obs;
  late Razorpay _razorpay;
  final key = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    CartProductApi();
    CartCount();
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
  }

  CartProductApi() async {
    hasData.value = false;
    cartProductList.clear();
    var url =await Uri.parse(baseUrl+ApiConstant.Cart);
    var response;
    await http.get(url,headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    }).then((value) {
      hasData.value = true;
      print(value);
      response = value;
    }).catchError((error){
      hasData.value = false;
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    cartProduct = CartProduct.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(cartProduct.data)) {
      if (!isNullEmptyOrFalse(cartProduct.data!.details)) {
        cartProduct.data!.details!.forEach((element) {
          cartProductList.add(element);
        }
        );
      }
    }
    cartProductList.refresh();
  }

  CartCount () async {
    Countlist.clear();
    var url = Uri.parse(baseUrl+ApiConstant.Count);
    var response = await http.get(url,headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json',
    } );
    print('response status:${response.body}');
    dynamic result = jsonDecode(response.body);
    count1= Count1.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(count1.data)) {
      Countlist.add(count1);
    }
    Countlist.refresh();
  }

  Future<void> UpdateCartAdd({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl+ApiConstant.Cart));
      request.body = json.encode({
        "productId": "${data.productId}",
        "quantity": "${++count}"
      });
      request.headers.addAll(headers);
      http.StreamedResponse? response ;
      await request.send().then((value){
        response = value;
        isLoading.value = true;
        CartProductApi();
        cartProductList.refresh();
      });

      if (response!.statusCode == 200) {

        Get.snackbar("Success","Qunatity Updated",snackPosition: SnackPosition.BOTTOM);
      }
      else {
        print(response!.reasonPhrase);
      }
    }catch(e){
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,);

    }
  }

  Future<void> UpdateCartRemove({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl+ApiConstant.Cart));
      request.body = json.encode({
        "productId": "${data.productId}",
        "quantity": "${--count}"
      });
      request.headers.addAll(headers);
      http.StreamedResponse? response ;
      await request.send().then((value){
        response = value;
        isLoading.value = true;
        CartProductApi();
        CartCount();
      });

      if (response!.statusCode == 200) {

        Get.snackbar("Success","Qunatity Updated",snackPosition: SnackPosition.BOTTOM);
      }
      else {
        print(response!.reasonPhrase);
      }
    }catch(e){
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,);

    }
  }

  Future<void> CartDeleteApi({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    print('${data.productId}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl+ApiConstant.Cart));
      request.body = json.encode({
        "productId": "${data.productId}",
        "quantity": 0
      });
      request.headers.addAll(headers);
      http.StreamedResponse? response ;
      await request.send().then((value){
        response = value;
        isLoading.value = true;
        CartProductApi();
        CartCount();
      });
      if (response!.statusCode == 200) {

        Get.snackbar("Success","Product Remove From Your Cart ",snackPosition: SnackPosition.BOTTOM);
      }
      else {
        print(response!.reasonPhrase);
      }
    }catch(e){
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,);

    }
  }

  Future<void> checkoutApi() async {
    var url = Uri.parse(baseUrl+ApiConstant.checkout);
    var response = await http.post(url, body: {
    },headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    dynamic result = jsonDecode(response.body);
    checkout = Checkout.fromJson(result);
    if(response.statusCode == 200){
      if (!isNullEmptyOrFalse(checkout)) {
        Checkoutlist=checkout.data!.order;
      }
      cartProductList.refresh();
      var options = {
        "key": "rzp_test_Ad3xOmLFP1EkRf",
        "amount": "${checkout.data!.order!.amount}",
        "name": "Waggs Payment",
        "description": "",
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
    else
      {
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
        Get.snackbar("Error", res.message.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.red,colorText: Colors.white);
      }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    Get.snackbar("Success","Payment Done",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
  }

}
