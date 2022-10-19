import 'dart:convert';
import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

import '../../../Modal/CategoryModel.dart';
import '../../../Modal/GetAllProductModule.dart';
import '../../../Modal/SubCategoryModel.dart';
import '../../../Modal/TopSellingStore.dart';
import '../../../Modal/shippingModel.dart';
import '../../../constant/SizeConstant.dart';

class ProductController extends GetxController {
  RxBool isSubCategory = false.obs;
  RxBool isTopProduct = false.obs;
  // Sellers sellers = Get.arguments;

  SubCategoryData subCategoryData = Get.arguments;
  GetAllproduct getAllproduct = GetAllproduct();
  RxList<Products> productList = RxList<Products>([]);
  RxList<CategoryData> CatagoryList = RxList<CategoryData>([]);
  RxList<Products> mainProductList = RxList<Products>([]);
  RxList<SubCategoryData> SubCatagoryList = RxList<SubCategoryData>([]);
  RxList<SubCategoryData> subData = RxList<SubCategoryData>([]);
  SubCategorymodel subCategorymodel = SubCategorymodel();
  RxBool hasData = false.obs;
  Rx<double> shippingCharge = 0.0.obs;
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

  Future ShippingApi() async {
    var url = Uri.parse(baseUrl + ApiConstant.shipping);
    var response = await http.get(url);
    print('response status:${response.request}');
    dynamic result = jsonDecode(response.body);
    print(result);
    if (response.statusCode == 200) {
      ShippingModel res = ShippingModel.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data!.shippingCharge)) {
          shippingCharge.value =
              double.parse(res.data!.shippingCharge.toString());
        }
      }
    }
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
    await ShippingApi();
    print(response.body);
    dynamic result = jsonDecode(response.body);
    getAllproduct = GetAllproduct.fromJson(result);
    Position? currentPositionData = await getCurrentLocation();

    if (!isNullEmptyOrFalse(getAllproduct.data)) {
      if (!isNullEmptyOrFalse(getAllproduct.data!.products)) {
        getAllproduct.data!.products!.forEach((element) {
          if (!isNullEmptyOrFalse(element)) {
            if (!isNullEmptyOrFalse(element.sellerId)) {
              if (!isNullEmptyOrFalse(currentPositionData)) {
                if (!isNullEmptyOrFalse(element.sellerId!.latitude) &&
                    !isNullEmptyOrFalse(element.sellerId!.longitude) &&
                    !isNullEmptyOrFalse(currentPositionData!.latitude) &&
                    !isNullEmptyOrFalse(currentPositionData.longitude)) {
                  double lat2 = element.sellerId!.latitude!;
                  double lat1 = currentPositionData.latitude;
                  double lon2 = element.sellerId!.longitude!;
                  double lon1 = currentPositionData.longitude;
                  var p = 0.017453292519943295;
                  var c = cos;
                  var a = 0.5 -
                      c((lat2 - lat1) * p) / 2 +
                      c(lat1 * p) *
                          c(lat2 * p) *
                          (1 - c((lon2 - lon1) * p)) /
                          2;
                  double distance =
                      12742 * asin(sqrt(a)) * shippingCharge.value;
                  element.sellerId!.distance = distance;
                  print("My Distance := ${distance}");
                }
              }
            }
          }

          mainProductList.add(element);
        });
      }
    }
    mainProductList.refresh();
  }
}
