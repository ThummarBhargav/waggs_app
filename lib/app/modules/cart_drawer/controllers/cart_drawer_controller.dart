import 'dart:convert';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../Modal/CartProductModel.dart';

import '../../../Modal/shippingModel.dart';
import '../../../constant/ConstantUrl.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:waggs_app/app/Modal/CartCountModel.dart';

import 'package:waggs_app/app/constant/sizeConstant.dart';

class CartDrawerController extends GetxController {
  Shipping1 shipping1 = Shipping1();
  Count1 count1 = Count1();
  RxBool hasData = false.obs;
  RxBool isLoading = false.obs;
  CartProduct cartProduct = CartProduct();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  RxList<Details> cartProductList = RxList<Details>([]);
  RxList<Count1> Countlist = RxList<Count1>([]);
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      CartCount();
      CartProductApi();
      ShippingApi();
      super.onInit();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ShippingApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.shipping);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    print(result);
    if (response.statusCode == 200) {
      ShippingModel res = ShippingModel.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        shipping1 = res.data!;
        print(shipping1);
      }
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
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
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
        CartCount();
      });

      if (response!.statusCode == 200) {
        cartProductList.forEach((element) {
          if (element.productId == data.productId) {
            element.quantity = element.quantity! + 1;
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
        CartCount();
      });
      if (response!.statusCode == 200) {
        cartProductList.forEach((element) {
          if (element.productId == data.productId) {
            element.quantity = element.quantity! - 1;
          }
        });
        cartProductList.refresh();
      } else {
        print(response!.reasonPhrase);
      }
    } catch (e) {}
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

  CartProductApi() async {
    hasData.value = false;
    cartProductList.clear();
    var url = await Uri.parse(baseUrl + ApiConstant.Cart);
    var response;
    await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    }).then((value) async {
      print(value);
      response = value;
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      dynamic result = jsonDecode(response.body);
      cartProduct = CartProduct.fromJson(result);
      print(result);
      Position? currentPositionData = await getCurrentLocation();
      if (!isNullEmptyOrFalse(cartProduct.data)) {
        if (!isNullEmptyOrFalse(cartProduct.data!.details)) {
          cartProduct.data!.details!.forEach((element) {
            if (!isNullEmptyOrFalse(element.product)) {
              if (!isNullEmptyOrFalse(element.product!.sellerId)) {
                if (!isNullEmptyOrFalse(currentPositionData)) {
                  if (!isNullEmptyOrFalse(
                          element.product!.sellerId!.latitude) &&
                      !isNullEmptyOrFalse(
                          element.product!.sellerId!.longitude) &&
                      !isNullEmptyOrFalse(currentPositionData!.latitude) &&
                      !isNullEmptyOrFalse(currentPositionData.longitude)) {
                    double lat2 = element.product!.sellerId!.latitude!;
                    double lat1 = currentPositionData.latitude;
                    double lon2 = element.product!.sellerId!.longitude!;
                    double lon1 = currentPositionData.longitude;
                    var p = 0.017453292519943295;
                    var c = cos;
                    var a = 0.5 -
                        c((lat2 - lat1) * p) / 2 +
                        c(lat1 * p) *
                            c(lat2 * p) *
                            (1 - c((lon2 - lon1) * p)) /
                            2;
                    print("My Distance := ${12742 * asin(sqrt(a))}");
                  }
                }
              }
            }
            cartProductList.add(element);
          });
        }
      }
      hasData.value = true;
      cartProductList.refresh();
    }).catchError((error) {
      hasData.value = false;
    });
  }
}
