import 'dart:convert';

import 'package:get/get.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart'  as http;

import '../../../Modal/CategoryModel.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../constant/SizeConstant.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController
  var data = Get.arguments;
  GetAllproduct getAllproduct = GetAllproduct();
  RxList<Products> productList = RxList<Products>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);
  RxList<Products> mainProductList = RxList<Products>([]);

  @override
  void onInit() {
    getProduct();
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

  getProduct() async {
    var URl = Uri.parse(baseUrl+ApiConstant.getAllProductUsers + "?subCategory=$data");
    var response = await http.get(URl);
    print(response.body);
    var data1 =jsonEncode(response.body);
    print(data1[3]);

  }
}
