import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/OrderModel.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:waggs_app/app/Modal/ErrorResponse.dart';
import 'package:waggs_app/app/Modal/checkoutModel.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import '../../../../main.dart';
import '../../../Modal/CartCountModel.dart';
import '../../../Modal/CartProductModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import 'package:http/http.dart' as http;

class ViewCartController extends GetxController {
  RxBool hasData = false.obs;
  RxList<Details> cartProductList = RxList<Details>([]);
  CartProduct cartProduct = CartProduct();
  RxList<Count1> Countlist = RxList<Count1>([]);
  Count1 count1 = Count1();
  Checkout checkout = Checkout();
  Order? Checkoutlist;
  RxBool isLoading = false.obs;
  RxBool isChange = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> apartmentController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> couponController = TextEditingController().obs;
  RxBool emailVisible = true.obs;
  RxBool nameVisible = true.obs;
  RxBool emailCheckBox = false.obs;
  RxBool detailCheckBox = false.obs;
  Rx<Position>? _currentPosition;
  String _currentAddress = '';
  Geolocator geolocator = Geolocator();
  late Razorpay _razorpay;
  final key = GlobalKey<FormState>();
  Orders1 orders1 = Orders1();
  RxList<Orders1> OrderList = RxList<Orders1>([]);
  RxList<Map<String, dynamic>> orderData = RxList<Map<String, dynamic>>([]);

  @override
  void onInit() {
    super.onInit();
    CartProductApi();
    getCurrentLocation();
    CartCount();
  }

  getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      _currentPosition = position.obs;
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.value.latitude, _currentPosition!.value.longitude);
      Placemark place = placemarks[0];
      _currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country}";
      print("CurrentAddress====================" + _currentAddress);
    } catch (e) {
      print(e);
    }
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
    var url = await Uri.parse(baseUrl + ApiConstant.Cart);
    var response;
    await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    }).then((value) {
      hasData.value = true;
      print(value);
      response = value;
    }).catchError((error) {
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
        });
      }
    }
    cartProductList.refresh();
  }

  CartCount() async {
    Countlist.clear();
    var url = Uri.parse(baseUrl + ApiConstant.Count);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json',
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

  Future<void> UpdateCartAdd({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try {
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiConstant.Cart));
      request.body = json
          .encode({"productId": "${data.productId}", "quantity": "${++count}"});
      request.headers.addAll(headers);
      http.StreamedResponse? response;
      await request.send().then((value) {
        response = value;
        // isLoading.value = true;
        // CartProductApi();
        CartCount();
      });

      if (response!.statusCode == 200) {
        cartProductList.forEach((element) {
          if (element.productId == data.productId) {
            element.quantity = element.quantity! + 1;
          }
        });
        cartProductList.refresh();
        Get.snackbar("Success", "Qunatity Updated",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print(response!.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> UpdateCartRemove({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try {
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiConstant.Cart));
      request.body = json
          .encode({"productId": "${data.productId}", "quantity": "${--count}"});
      request.headers.addAll(headers);
      http.StreamedResponse? response;
      await request.send().then((value) {
        response = value;
        // isLoading.value = true;
        // CartProductApi();
        CartCount();
      });

      if (response!.statusCode == 200) {
        Get.snackbar("Success", "Qunatity Updated",
            snackPosition: SnackPosition.BOTTOM);
        cartProductList.forEach((element) {
          if (element.productId == data.productId) {
            element.quantity = element.quantity! - 1;
          }
        });
        cartProductList.refresh();
      } else {
        print(response!.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> CartDeleteApi({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    print('${data.productId}');
    try {
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl + ApiConstant.Cart));
      request.body =
          json.encode({"productId": "${data.productId}", "quantity": 0});
      request.headers.addAll(headers);
      http.StreamedResponse? response;
      await request.send().then((value) {
        response = value;
        isLoading.value = true;
        CartProductApi();
        CartCount();
      });
      if (response!.statusCode == 200) {
        Get.snackbar("Success", "Product Remove From Your Cart ",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print(response!.reasonPhrase);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> Allorder() async {
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
              dict["GroupBy"] = element.orderNo!;
              dict["OrderData"] = element;

              orderData.add(dict);

              Get.toNamed(Routes.ORDER_PAGE, arguments: {
                ArgumentConstant.orderData: orderData,
              });
            });
          }
        }
        print(orderData);
      }
    } else {}
    OrderList.refresh();
  }

  dialogBox(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Select address",
                      style: GoogleFonts.publicSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "Please Enter Password",
                        decoration: InputDecoration(
                          hintText: "Search for area",
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(
                          "latitude===============${_currentPosition!.value.latitude}");
                      print(
                          "longitude===============${_currentPosition!.value.longitude}");
                      _getAddressFromLatLng();
                    },
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.my_location,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                            height: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Get Current location",
                                style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(33, 43, 54, 1)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Using gps",
                                style: GoogleFonts.publicSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(99, 115, 129, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(31, 193, 244, 1),
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> checkoutApi() async {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    var url = Uri.parse(baseUrl + ApiConstant.checkout);
    var response = await http.post(url, body: {}, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    dynamic result = jsonDecode(response.body);
    checkout = Checkout.fromJson(result);
    if (response.statusCode == 200) {
      if (!isNullEmptyOrFalse(checkout)) {
        Checkoutlist = checkout.data!.order;
      }
      cartProductList.refresh();
      var options = {
        "key": "${ApiConstant.paymentKey}",
        "amount": "${checkout.data!.order!.amount}",
        "name": "Waggs",
        "order_id": "${checkout.data!.order!.id}",
        // "timeout": "180",
        "currency": "INR",
        // 'send_sms_hash': true,
        "prefill": {
          "contact": "${box.read(ArgumentConstant.phone)}",
          "email": "${box.read(ArgumentConstant.email)}",
          "name": "${box.read(ArgumentConstant.name)}"
        },
      };
      print(options);
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

  updateTrans(String paymentId, String OrderId, String Signature) async {
    Dio dio = Dio();
    Options option = Options(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    try {
      final response = await dio.put(
        baseUrl +
            ApiConstant.transcation +
            "/${checkout.data!.transaction!.sId}",
        data: {
          "paymentDetails": {
            "paymentId": "${paymentId}",
            "orderId": "${OrderId}",
            "signature": "${Signature}"
          }
        },
        options: option,
      );
      print("UPDATE=========" + response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
      } else if (response.statusCode == 400) {
      } else {}
    } on SocketException {}
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    updateTrans(response.paymentId.toString(), response.orderId.toString(),
        response.signature.toString());
    Allorder();

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
