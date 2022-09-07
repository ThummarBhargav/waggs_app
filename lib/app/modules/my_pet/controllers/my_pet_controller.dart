import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/AllPetModel.dart';
import '../../../../main.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class MyPetController extends GetxController {

AllPetModel allPetModel =AllPetModel();
RxList<AllData> AllpetList = RxList<AllData>([]);
  @override
  void onInit() {
    GetAllpet();
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

  GetAllpet() async {
    var url = Uri.parse(baseUrl+ApiConstant.getpet);
    var response = await http.get(url,headers: {
    'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    print('response status:${response.request}');
    print('response status:${response.body}');
    dynamic result = jsonDecode(response.body);
    allPetModel = AllPetModel.fromJson(result);
    print(result);
    if (!isNullEmptyOrFalse(allPetModel.data)) {
      allPetModel.data!.forEach((element) {
        AllpetList.add(element);
      }
      );
    }
  }

}
