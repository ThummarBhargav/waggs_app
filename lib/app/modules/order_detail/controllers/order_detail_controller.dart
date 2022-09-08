import 'dart:convert';

import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../Modal/OrderDetailModel.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
class OrderDetailController extends GetxController {


  final count = 0.obs;
  String? orderId;
  RxBool hasData = false.obs;
  OrderDetailModel? orderDetailModel;
  @override
  void onInit() {
    super.onInit();
    if(Get.arguments!=null){
      orderId = Get.arguments[ArgumentConstant.orderId];
      getOrderDetails();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
  getOrderDetails() async {
    hasData.value=false;

    var url = Uri.parse(baseUrl + ApiConstant.orderDetail+orderId!);
    var response = await http.get(url,headers:{
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json'
    } );
    hasData.value=true;
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
     orderDetailModel = OrderDetailModel.fromJson(result);
    // if (!isNullEmptyOrFalse(bannerModel.data)) {
    //   bannerModel.data!.forEach((element) {
    //     bannerList.add(element);
    //   }
    //   );
    //   getAllUserApi();
    // }
  }
  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
