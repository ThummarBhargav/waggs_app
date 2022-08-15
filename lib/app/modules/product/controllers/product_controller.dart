import 'dart:convert';

import 'package:get/get.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart'  as http;

import '../../../Modal/CategoryModel.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../Modal/SubCategoryModel.dart';
import '../../../constant/SizeConstant.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController
  SubCategoryData data = Get.arguments;
  GetAllproduct getAllproduct = GetAllproduct();
  RxList<Products> productList = RxList<Products>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);
  RxList<Products> mainProductList = RxList<Products>([]);
  RxList<SubCategoryData> SubCatagoryList = RxList<SubCategoryData>([]);
  RxList<SubCategoryData> subData = RxList<SubCategoryData>([]);
  SubCategorymodel subCategorymodel = SubCategorymodel();
  RxBool hasData = false.obs;

  @override
  void onInit() {
    getProduct();
    SubCategory();
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



  SubCategory() async {
    var url = Uri.parse(baseUrl+ApiConstant.AllSubCategory);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    subCategorymodel = SubCategorymodel.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(subCategorymodel.data)) {
      subCategorymodel.data!.forEach((element) {
        SubCatagoryList.add(element);
      }
      );
      subData.clear();
      SubCatagoryList.forEach((element) {
        if(element.sId==data){
          subData.add(element);
          print("data================"+ subData[0].name.toString());
        }else
          {
          }
      });
    }
  }



  getProduct() async {
    hasData.value = false;
    mainProductList.clear();
    var URl = Uri.parse(baseUrl+ApiConstant.getAllProductUsers + "?subCategory=${data.sId}");
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
