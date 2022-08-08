import 'dart:convert';

import 'package:get/get.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';

import '../../../Modal/GetAllProductModule.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  GetAllproduct getAllproduct = GetAllproduct();
  var UserList = <Products>[].obs;
  @override
  void onInit() {
    getAllUserApi();
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

  getAllUserApi() async {
    var url = Uri.parse(baseuel1 + ApiConstant.getAllProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    getAllproduct =  GetAllproduct.fromJson(result);
    if(!isNullEmptyOrFalse(getAllproduct.data)){
      if(!isNullEmptyOrFalse(getAllproduct.data!.products)){
        getAllproduct.data!.products!.forEach((element) {

          UserList.add(element);

        });
      }
    }

  }
}
