import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/CartCountModel.dart';
import 'package:waggs_app/app/Modal/CartProductModel.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/main.dart';
import '../../../Modal/shippingModel.dart';
import '../../../constant/SizeConstant.dart';

class ViewProductController extends GetxController {
  //TODO: Implement ViewProductController

  var scaffoldKey = GlobalKey<ScaffoldState>();
  Products0 data = Get.arguments;
  RxString url = ''.obs;
  final count = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isOpen = false.obs;
  RxBool isOpen1 = false.obs;
  RxBool hasData = false.obs;
  RxList<Products0> mainProductList = RxList<Products0>([]);
  StoreModule storeModule = StoreModule();
  Count1 count1 = Count1();
  RxInt countData = 0.obs;
  CartProduct cartProduct = CartProduct();
  RxList<Count1> Countlist = RxList<Count1>([]);
  RxList<Details> cartProductList = RxList<Details>([]);
  Rx<double> shippingCharge = 0.0.obs;
  @override
  void onInit() {
    CartCount();
    getData();
    CartProductApi();
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

  Future ShippingApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.shipping);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    print(result);
    if (response.statusCode == 200) {
      ShippingModel res = ShippingModel.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data!.shippingCharge)) {
          shippingCharge.value =
              double.parse(res.data!.shippingCharge.toString());
        }
      }
    }
  }

  getData() async {
    hasData.value = false;
    mainProductList.clear();
    var URl = Uri.parse(baseUrl + ApiConstant.getAllProductUsers);
    print(URl);
    var response;
    await http.get(URl).then((value) {
      hasData.value = true;
      response = value;
    }).catchError((error) {
      hasData.value = true;
    });
    print(response.body);
    dynamic result = jsonDecode(response.body);
    storeModule = StoreModule.fromJson(result);
    Position? currentPositionData = await getCurrentLocation();
    await ShippingApi();

    if (!isNullEmptyOrFalse(storeModule.data)) {
      if (!isNullEmptyOrFalse(storeModule.data!.products)) {
        storeModule.data!.products!.forEach((element) {
          if (!isNullEmptyOrFalse(element)) {
            if (!isNullEmptyOrFalse(element.sellerId)) {
              if (!isNullEmptyOrFalse(currentPositionData)) {
                if (!isNullEmptyOrFalse(element.sellerId!.latitude) &&
                    !isNullEmptyOrFalse(element.sellerId!.longitude) &&
                    !isNullEmptyOrFalse(currentPositionData!.latitude) &&
                    !isNullEmptyOrFalse(currentPositionData.longitude)) {
                  double lat2 = element.sellerId!.latitude!;
                  double lat1 = currentPositionData.latitude;
                  double lon2 = element.sellerId!.longitude!;
                  double lon1 = currentPositionData.longitude;

                  var p = 0.017453292519943295;
                  var c = cos;
                  var a = 0.5 -
                      c((lat2 - lat1) * p) / 2 +
                      c(lat1 * p) *
                          c(lat2 * p) *
                          (1 - c((lon2 - lon1) * p)) /
                          2;
                  double distance =
                      12742 * asin(sqrt(a)) * shippingCharge.value;
                  element.sellerId!.distance = distance;
                  print("My Distance := ${distance}");
                }
              }
            }
          }

          mainProductList.add(element);
        });
      }
    }
    mainProductList.refresh();
  }

  Future<void> addToCart({required Products0 data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    try {
      var url = Uri.parse(baseUrl + ApiConstant.Cart);
      var response;
      await http.post(url, body: {
        'productId': '${data.sId}',
      }, headers: {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      }).then((value) {
        response = value;
        CartProductApi();
        CartCount();
      });
      print(jsonDecode(response.body).runtimeType);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Product Successfully add to cart",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      } else {
        Get.snackbar("Error", "Product already in cart",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orangeAccent);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orangeAccent);
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
      countData.value = count1.data ?? 0;
    }
    Countlist.refresh();
    countData.refresh();
    update();
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
}
