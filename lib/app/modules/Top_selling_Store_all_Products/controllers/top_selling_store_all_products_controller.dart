import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:waggs_app/app/Modal/CartCountModel.dart';
import 'package:waggs_app/app/Modal/CartProductModel.dart';
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
  RxList<Products0> mainProductList = RxList<Products0>([]);
  RxBool hasData = false.obs;
  RxBool drawer = false.obs;
  RxBool drawer2 = false.obs;
  String CategoriId = "";
  String SubCategoriId = "";
  StoreModule storeModule = StoreModule();
  Rx<RangeValues> values1 =  RangeValues(0, 100).obs;
  Rx<RangeValues> values4 = RangeValues(0, 100).obs;
  RxBool isOp = false.obs;
  RxBool isOp1 = false.obs;
  RxBool isOp2 = false.obs;
  RxBool isOp3 = false.obs;
  RxBool isOp4 = false.obs;
  RxBool isOp5 = false.obs;
  RxBool isOp6 = false.obs;
  RxBool isOp7 = false.obs;
  RxBool checkBox = false.obs;
  RxBool colorCheckBox = false.obs;
  String selectedValue = "New Arrivals";
  RxInt subDataIndex= 0.obs;
  Count1 count1 = Count1();
  RxList<Count1> Countlist = RxList<Count1>([]);
  RxList<Fields> fieldData = RxList<Fields>([]);
  RxString price = "New Arrivals".obs;
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
  RxBool isFilterDrawer = false.obs;
  CartProduct cartProduct =CartProduct();
  RxList<Details> cartProductList = RxList<Details>([]);
  RxBool isLoading = false.obs;
  List respons =[];
  @override
  void onInit() {
    getProduct();
    AllCategory();
    SubCategory();
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
    storeModule = StoreModule.fromJson(result);
    if (!isNullEmptyOrFalse(storeModule.data)) {
      if (!isNullEmptyOrFalse(storeModule.data!.products)) {
        storeModule.data!.products!.forEach((element) {
          mainProductList.add(element);
        });
      }
    }
    mainProductList.refresh();
  }

  // getAllUserApi() async {
  //   var url = Uri.parse(baseUrl + ApiConstant.getAllProductUsers);
  //   var response = await http.get(url);
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   dynamic result = jsonDecode(response.body);
  //   getAllproduct = GetAllproduct.fromJson(result);
  //   if (!isNullEmptyOrFalse(getAllproduct.data)) {
  //     if (!isNullEmptyOrFalse(getAllproduct.data!.products)) {
  //       getAllproduct.data!.products!.forEach((element) {
  //         mainProductList.add(element);
  //       });
  //       mainProductList.forEach((element) {
  //         if (element.category!.sId == CatagoryList[0].sId &&
  //             element.subCategory!.categoryId == CatagoryList[0].sId) {
  //           productList.add(element);
  //         }
  //       });
  //       productList.refresh();
  //     }
  //   }
  // }

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
    SubCatagoryList.clear();
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
    Countlist.clear();
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
    Countlist.refresh();
  }

  Future<void> addToCart({required Products0 data}) async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
    print('${data.sId}');
    try{
      var url = Uri.parse(baseUrl+ApiConstant.Cart);
      var response = await http.post(url, body: {
        'productId': '${data.sId}',
      },headers: {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      }
      );
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
        "quantity": "${--count}"
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

  getFilterData({required List reqList,required BuildContext context}) async {

    Map<String,dynamic> queryParameters = {};
    queryParameters["skip"]="0";
    queryParameters["limit"]="10";
    queryParameters["search"]="";
    queryParameters["sort"]="newArrivals";
    queryParameters["category"]="${CategoriId}";
    queryParameters["subCategory"]="${SubCategoriId}";
    queryParameters["priceMin"]="";
    queryParameters["priceMax"]="";
    queryParameters["discountMin"]="0";
    queryParameters["discountMax"]="0";
    queryParameters["sellerId"]="62dd1f3f8fc27b7077099db4";
    queryParameters["latitude"]="21.1702401";
    queryParameters["longitude"]="72.83106070000001";
    if(!isNullEmptyOrFalse(reqList)){
      reqList.forEach((element) {
        queryParameters[element[0]] = (isNullEmptyOrFalse(element[1]))?element[1]:jsonEncode(element[1]);
      });
    }

   print("Query Parameter := ${queryParameters}");
   print("Query Parameter := ${queryParameters}");

    // var url = Uri.https(baseUrl,ApiConstant.getAllProductUsers,queryParameters);

    var uri =
    Uri.https("api.waggs.in", '/api/v1/products', queryParameters);
    print(uri);
    var response ;
    await http.get(uri).then((value) {
      response = value;
      mainProductList.clear();

    });
    dynamic result = jsonDecode(response.body);
    storeModule = StoreModule.fromJson(result);

    if(response.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success.......")));
      if (!isNullEmptyOrFalse(storeModule.data)) {
        if (!isNullEmptyOrFalse(storeModule.data!.products)) {
          storeModule.data!.products!.forEach((element) {
            mainProductList.add(element);
          });
        }
      }
      mainProductList.refresh();
    }
    else if (response.statusCode == 404){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Not Found")));
      print("Product Not Found");
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong.......")));
      print("Something went wrong.......");
    }

  }
}
