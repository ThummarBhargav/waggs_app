import 'dart:convert';

import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/CartCountModel.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/main.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../Modal/SubCategoryModel.dart';
import '../../../Modal/TopSellingStore.dart';
import '../../../constant/SizeConstant.dart';

class ProductListScreenController extends GetxController {
  bool isFromSellingStore = false;
  bool isFromTopProducts = false;
  bool isFromSubCategory = false;
  RxBool hasData = false.obs;
  List<Sellers> sellerList = [];
  StoreModule storeModule = StoreModule();
  RxList<Products0> mainProductList = RxList<Products0>([]);
  RxList<Products> SellerProductList = RxList<Products>([]);
  GetAllproduct getAllproduct = GetAllproduct();
  List<Products0> TopProductList = [];
  late SubCategoryData subCategoryData;
  late Sellers data;
  List respons =[];
  Count1 count1 = Count1();
  RxList<Count1> Countlist = RxList<Count1>([]);
  @override
  void onInit() {
    if (Get.arguments != null) {
      isFromTopProducts = Get.arguments[ArgumentConstant.isFromTopProducts];
      isFromSubCategory = Get.arguments[ArgumentConstant.isFromSubCategory];
      isFromSellingStore = Get.arguments[ArgumentConstant.isFromSellingStore];


      if (isFromSellingStore) {
        sellerList = Get.arguments[ArgumentConstant.sellerList];
      }
      if (isFromTopProducts) {
        TopProductList = Get.arguments[ArgumentConstant.TopProductlist];
      }
      if (isFromSubCategory) {
        subCategoryData = Get.arguments[ArgumentConstant.subcategoryData];
        getProduct();
      }


    }
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
    var URl = Uri.parse(baseUrl +
        ApiConstant.getAllProductUsers +
        "?subCategory=${subCategoryData.sId}");
    print(URl);
    var response;
    await http.get(URl).then((value) {
      hasData.value = true;
      response = value;
    }).catchError((error) {
      hasData.value = true;
    });
    print(response.body);
    dynamic result = jsonDecode(response.body);
    storeModule = StoreModule.fromJson(result);
    if (!isNullEmptyOrFalse(storeModule.data)) {
      if (!isNullEmptyOrFalse(storeModule.data!.products)) {
        storeModule.data!.products!.forEach((element) {
          mainProductList.add(element);
        }
        );
      }
    }
    mainProductList.refresh();
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
}
