import 'dart:convert';

import 'package:get/get.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
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

}
