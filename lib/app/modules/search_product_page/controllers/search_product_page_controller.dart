import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';

import '../../../Modal/TopSellingStore.dart';
import '../../../constant/SizeConstant.dart';

class SearchProductPageController extends GetxController {
  //TODO: Implement SearchProductPageController

  String searchProduct = "";
  RxBool hasData = false.obs;
  StoreModule storeModule = StoreModule();
  RxList<Products0> mainProductList = RxList<Products0>([]);
  final count = 0.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      searchProduct = Get.arguments[ArgumentConstant.searchProduct];
    }
    searchProductApi();
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

  searchProductApi() async {
    hasData.value = false;
    mainProductList.clear();
    var url = Uri.parse(
        baseUrl + ApiConstant.getAllProductUsers + "?search=${searchProduct}");
    var response;
    await http.get(url).then((value) {
      response = value;
      hasData.value = true;
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      dynamic result = jsonDecode(response.body);
      storeModule = StoreModule.fromJson(result);
      print(result);
      if (!isNullEmptyOrFalse(storeModule.data)) {
        if (!isNullEmptyOrFalse(storeModule.data!.products)) {
          storeModule.data!.products!.forEach((element) {
            mainProductList.add(element);
          });
        }
      }
    }).catchError((error) {
      hasData.value = false;
      print(error);
    });
  }
}
