import 'dart:convert';

import 'package:get/get.dart';

import '../../../Modal/GetAllProductModule.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var UserList = <GetAllproduct>[].obs;

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

  getAllUserApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.getAllProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print("Data := ${jsonDecode(response.body)}");
      dynamic result = jsonDecode(response.body);
      result.forEach((element) {
        UserList.add(GetAllproduct.fromJson(element));
      });
      print("My Data := ${UserList}");
    } else {
      Get.snackbar('Error Loding Data!',
          'Server responded:${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

}
