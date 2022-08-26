import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';
import '../../../Modal/CartCountModel.dart';
import '../../../Modal/CartProductModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class FilterController extends GetxController {
  //TODO: Implement FilterController
  RxBool isFilterDrawer = false.obs;
  Count1 count1 = Count1();
  RxBool hasData = false.obs;
  RxBool isLoading = false.obs;
  RxList<Count1> Countlist = RxList<Count1>([]);


  RxList<Details> cartProductList = RxList<Details>([]);
  CartProduct cartProduct =CartProduct();



  final count = 0.obs;
  @override
  void onInit() {
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

  Future<void> CartDeleteApi({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    print('${data.productId}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse('https://api.waggs.in/api/v1/cart'));
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
  Future<void> UpdateCartRemove({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse('https://api.waggs.in/api/v1/cart'));
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

  Future<void> UpdateCartAdd({required Details data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    var count = data.quantity!;
    print('${data.productId}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse('https://api.waggs.in/api/v1/cart'));
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


}
