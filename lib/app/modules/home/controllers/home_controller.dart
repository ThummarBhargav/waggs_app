import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waggs_app/app/Modal/CartCountModel.dart';
import 'package:waggs_app/app/Modal/CartProductModel.dart';
import 'package:waggs_app/app/Modal/CategoryModel.dart';
import 'package:waggs_app/app/Modal/SubCategoryModel.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import '../../../../main.dart';
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
  Count1 count1 = Count1();
  RxBool hasData = false.obs;
  RxBool isLoading = false.obs;
  CartProduct cartProduct =CartProduct();
  SubCategorymodel subCategorymodel = SubCategorymodel();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  RxList<Products> mainProductList = RxList<Products>([]);
  RxList<Details> cartProductList = RxList<Details>([]);
  RxList<Products> productList = RxList<Products>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);
  RxList<SubCategoryData> SubCatagoryList = RxList<SubCategoryData>([]);
  RxList<SubCategoryData> subData = RxList<SubCategoryData>([]);
  RxList<BannerData> bannerList = RxList<BannerData>([]);
  TextEditingController searchController = TextEditingController();
  RxList<Products0> TopProductlist = RxList<Products0>([]);
  RxList<Sellers> SellersList = RxList<Sellers>([]);
  RxList<Count1> Countlist = RxList<Count1>([]);
  List<String> imageList = ['assets/category01.jpg','assets/category02.jpg',
    'assets/category03.jpg','assets/category04.jpg','assets/category05.jpg'].obs;
  List respons =[];
  List respons1=[];
  final count = 0.obs;
  RxBool isOpen = false.obs;
  RxBool isOpen1 = false.obs;
  RxString url = ''.obs;
  @override
  void onInit() {
    bannerAllProduct();
    AllCategory();
    SubCategory();
    TopSellingStoreApi();
    TopSellingProductApi();
    CartCount();
    CartProductApi();
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

  Future<void> addToCart({required Products0 data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    try{
      var url = Uri.parse(baseUrl+ApiConstant.Cart);
      var response ;
       await http.post(url, body: {
        'productId': '${data.sId}',
      },headers: {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      }
      ).then((value) {
        response = value;
        CartProductApi();
        CartCount();

       });
      respons.add(response.body);
      print(jsonDecode(response.body).runtimeType);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(response.statusCode==200){
        Get.snackbar("Success","Product Successfully add to cart",snackPosition: SnackPosition.BOTTOM);

      }
      else{
        Get.snackbar("Error", "Product already in cart",snackPosition: SnackPosition.BOTTOM);
      }
    }catch(e){
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,);

    }
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
        "quantity": "${count>1?--count:count}"
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
      // respons = value as List;
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
 }
