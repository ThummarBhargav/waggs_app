import 'dart:convert';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/CategoryModel.dart';
import 'package:waggs_app/app/Modal/SubCategoryModel.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  GetAllproduct getAllproduct = GetAllproduct();
  CategoryModel categoryModel = CategoryModel();
  SubCategorymodel subCategorymodel = SubCategorymodel();
  RxList<Products> mainProductList = RxList<Products>([]);
  RxList<Products> productList = RxList<Products>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);

  @override
  void onInit() {

    AllCategory();
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
  AllCategory() async {
    var url = Uri.parse("https://api-stg.waggs.in/api/v1/category");
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    categoryModel =  CategoryModel.fromJson(result);
    print(result);
      if(!isNullEmptyOrFalse(categoryModel.catagoryData)){
        categoryModel.catagoryData!.forEach((element) {
          CatagoryList.add(element);
        }
        );
        CatagoryList[0].isSelected!.value = true;
        getAllUserApi();
      }
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
          mainProductList.add(element);
        }
        );
        mainProductList.forEach((element) {
          if(element.category!.sId == CatagoryList[0].sId&&element.subCategory!.categoryId == CatagoryList[0].sId){
            productList.add(element);
          }
        });
        productList.refresh();
      }
    }

  }
}
