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
  RxBool hasData = false.obs;

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
    hasData.value = false;
    mainProductList.clear();
    var URl = Uri.parse(baseUrl+ApiConstant.getAllProductUsers + "?subCategory=$data");
    print(URl);
    var response ;
     await http.get(URl).then((value) {
      hasData.value = true;
       response = value;
    }).catchError((error){
      hasData.value = true;
    });
    print(response.body);
    dynamic result = jsonDecode(response.body);
    getAllproduct = GetAllproduct.fromJson(result);
    if (!isNullEmptyOrFalse(getAllproduct.data)) {
      if (!isNullEmptyOrFalse(getAllproduct.data!.products)) {
        getAllproduct.data!.products!.forEach((element) {
          mainProductList.add(element);
         }
        );
      }
    }
    mainProductList.refresh();

  }
}
