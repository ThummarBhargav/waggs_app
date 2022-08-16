import 'dart:convert';

import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import '../../../constant/SizeConstant.dart';

class ViewProductController extends GetxController {
  //TODO: Implement ViewProductController
  Products0 data = Get.arguments;
  RxString url = ''.obs;
  final count = 0.obs;
  RxBool isOpen = false.obs;
  RxBool isOpen1 = false.obs;
  RxBool hasData = false.obs;
  RxList<Products0> mainProductList = RxList<Products0>([]);
  StoreModule storeModule = StoreModule();


  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getData() async {
    hasData.value = false;
    mainProductList.clear();
    var URl = Uri.parse(baseUrl +
        ApiConstant.getAllProductUsers +
        "/${data.sId}");
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
    if (!isNullEmptyOrFalse(storeModule.data)) {
      if (!isNullEmptyOrFalse(storeModule.data!.products)) {
        storeModule.data!.products!.forEach((element) {
          mainProductList.add(element);
        }
        );
      }
    }
    mainProductList.refresh();
  }


}
