import 'dart:convert';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../Modal/CartProductModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import 'package:http/http.dart' as http;

class ViewAllMyCartController extends GetxController {

  RxBool hasData = false.obs;
  RxList<Details> cartProductList = RxList<Details>([]);
  CartProduct cartProduct =CartProduct();

  @override
  void onInit() {
    super.onInit();
    CartProductApi();
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
    var url =await Uri.parse("https://api.waggs.in/api/v1/cart");
    var response;
    await http.get(url,headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    }).then((value) {
      hasData.value = true;
      print(value);
      response = value;
      // respons = value as List;
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
}
