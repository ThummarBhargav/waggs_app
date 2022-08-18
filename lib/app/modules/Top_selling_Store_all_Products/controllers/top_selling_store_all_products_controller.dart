import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:waggs_app/app/Modal/CartCountModel.dart';
import 'package:waggs_app/app/Modal/CategoryModel.dart';
import 'package:waggs_app/app/Modal/GetAllProductModule.dart';
import 'package:waggs_app/app/Modal/SubCategoryModel.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/main.dart';

class TopSellingStoreAllProductsController extends GetxController {
  //TODO: Implement TopSellingStoreAllProductsController
  Sellers data = Get.arguments;
  GetAllproduct getAllproduct = GetAllproduct();
  RxList<Products> mainProductList = RxList<Products>([]);
  RxBool hasData = false.obs;
  SfRangeValues values = const SfRangeValues(100, 30000);
  SfRangeValues values1 = const SfRangeValues(0, 100);
  RxBool isOp = false.obs;
  RxBool isOp1 = false.obs;
  RxBool isOp2 = false.obs;
  RxBool isOp3 = false.obs;
  RxBool isOp4 = false.obs;
  RxBool isOp5 = false.obs;
  RxBool isOp6 = false.obs;
  String selectedValue = "";
  RxInt subDataIndex= 0.obs;
  Count1 count1 = Count1();
  RxList<Count1> Countlist = RxList<Count1>([]);
  RxList<String> location = RxList<String>(["New Arrivals","Price: Low-High","Price: High-Low","Discount: Low-High","Discount: High-Low"]);
  RxList<Products> productList = RxList<Products>([]);
  RxList<SubCategoryData> SubCatagoryList = RxList<SubCategoryData>([]);
  SubCategorymodel subCategorymodel = SubCategorymodel();
  CategoryModel categoryModel = CategoryModel();
  RxList<SubCategoryData> subData = RxList<SubCategoryData>([]);
  RxList<SubCategoryData> Brand = RxList<SubCategoryData>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);
  RxString radioGValues = "".obs;
  RxString radioGValues1 = "".obs;
  RxString radioGValues2 = "".obs;
  RxString radioGValues3 = "".obs;
  RxString radioGValues4 = "".obs;
  RxString radioGValues5 = "".obs;
  RxString sidValues = "".obs;
  RxString subSidValues = "".obs;

  @override
  void onInit() {
    getProduct();
    AllCategory();
    SubCategory();
    CartCount();
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
    var URl = Uri.parse(
        baseUrl + ApiConstant.getAllProductUsers + "?sellerId=${data.sId}");
    var response;
    await http.get(URl).then((value) {
      hasData.value = true;
      response = value;
    }).catchError((err) {
      hasData.value = false;
    });
    print(response.body);
    dynamic result = jsonDecode(response.body);
    getAllproduct = GetAllproduct.fromJson(result);
    if (!isNullEmptyOrFalse(getAllproduct.data)) {
      if (!isNullEmptyOrFalse(getAllproduct.data!.products)) {
        getAllproduct.data!.products!.forEach((element) {
          mainProductList.add(element);
        });
      }
    }
    mainProductList.refresh();
  }

  getAllUserApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.getAllProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    getAllproduct = GetAllproduct.fromJson(result);
    if (!isNullEmptyOrFalse(getAllproduct.data)) {
      if (!isNullEmptyOrFalse(getAllproduct.data!.products)) {
        getAllproduct.data!.products!.forEach((element) {
          mainProductList.add(element);
        });
        mainProductList.forEach((element) {
          if (element.category!.sId == CatagoryList[0].sId &&
              element.subCategory!.categoryId == CatagoryList[0].sId) {
            productList.add(element);
          }
        });
        productList.refresh();
      }
    }
  }

  AllCategory() async {
    CatagoryList.clear();
    var url = Uri.parse(baseUrl + ApiConstant.AllCategory);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    categoryModel = CategoryModel.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(categoryModel.catagoryData)) {
      categoryModel.catagoryData!.forEach((element) {
        CatagoryList.add(element);
      });
    }
  }

  SubCategory() async {
    var url = Uri.parse(baseUrl + ApiConstant.AllSubCategory);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    subCategorymodel = SubCategorymodel.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(subCategorymodel.data)) {
      subCategorymodel.data!.forEach((element) {
        SubCatagoryList.add(element);
      });
    }
  }

  CartCount () async {
    var url = Uri.parse(baseUrl+ApiConstant.Count);
    var response = await http.get(url,headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    } );
    print('response status:${response.body}');
    dynamic result = jsonDecode(response.body);
    count1= Count1.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(count1.data)) {
      Countlist.add(count1);
    }
  }
}
