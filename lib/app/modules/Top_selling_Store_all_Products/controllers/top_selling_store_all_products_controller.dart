import 'dart:convert';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/GetAllProductModule.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart'  as http;
import 'package:waggs_app/app/constant/SizeConstant.dart';
class TopSellingStoreAllProductsController extends GetxController {
  //TODO: Implement TopSellingStoreAllProductsController
  Sellers data = Get.arguments;
  GetAllproduct getAllproduct = GetAllproduct();
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
    var URl = Uri.parse(baseUrl+ApiConstant.getAllProductUsers + "?sellerId=${data.sId}");
    var response ;
     await http.get(URl).then((value) {
      hasData.value = true;
      response = value;
    }).catchError((err){
      hasData.value = false;
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
