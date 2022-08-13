import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/CategoryModel.dart';
import 'package:waggs_app/app/Modal/SubCategoryModel.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../Modal/bannerAllProductModel.dart';
import '../../../constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  GetAllproduct getAllproduct = GetAllproduct();
  CategoryModel categoryModel = CategoryModel();
  bannerModels bannerModel = bannerModels();
  StoreModule storeModule = StoreModule();
  SubCategorymodel subCategorymodel = SubCategorymodel();
  RxList<Products> mainProductList = RxList<Products>([]);
  RxList<Products> productList = RxList<Products>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);
  RxList<SubCategoryData> SubCatagoryList = RxList<SubCategoryData>([]);
  RxList<SubCategoryData> subData = RxList<SubCategoryData>([]);
  RxList<BannerData> bannerList = RxList<BannerData>([]);
  TextEditingController searchController = TextEditingController();
  RxList<Products0> TopProductlist = RxList<Products0>([]);
  RxList<Sellers> SellersList = RxList<Sellers>([]);
  List<String> imageList = ['assets/category01.jpg','assets/category02.jpg',
    'assets/category03.jpg','assets/category04.jpg','assets/category05.jpg'].obs;


  @override
  void onInit() {
    AllCategory();
    SubCategory();
    TopSellingStoreApi();
    TopSellingProductApi();
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
    var url = Uri.parse(baseUrl+ApiConstant.AllCategory);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    categoryModel = CategoryModel.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(categoryModel.catagoryData)) {
      categoryModel.catagoryData!.forEach((element) {
        CatagoryList.add(element);
      }
      );
      getAllUserApi();
    }
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
      getAllUserApi();
    }
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
        }
        );
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

  bannerAllProduct() async {
    var url = Uri.parse(baseUrl + ApiConstant.bannerProductUsers);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    bannerModel = bannerModels.fromJson(result);
    if (!isNullEmptyOrFalse(bannerModel.data)) {
      bannerModel.data!.forEach((element) {
        bannerList.add(element);
      }
      );
      getAllUserApi();
    }
  }

  TopSellingStoreApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.TopStore);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    storeModule = StoreModule.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(storeModule.data)) {
      if (!isNullEmptyOrFalse(storeModule.data!.sellers)) {
        storeModule.data!.sellers!.forEach((element) {
          SellersList.add(element);

        }
        );
        getAllUserApi();
      }
    }
  }

  TopSellingProductApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.TopStore);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    storeModule = StoreModule.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(storeModule.data)) {
      if (!isNullEmptyOrFalse(storeModule.data!.products)) {
        storeModule.data!.products!.forEach((element) {
          TopProductlist.add(element);
        }
        );
        getAllUserApi();
      }
    }
  }
}
