import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/GetPetModel.dart';
import '../../../../main.dart';
import '../../../Modal/PetModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class AddPetController extends GetxController {

  Data1  data = Get.arguments;
  TextEditingController name = TextEditingController(text: 'New Pet');
  TextEditingController Gender = TextEditingController(text: 'New Pet');
  TextEditingController age = TextEditingController();
  TextEditingController breed = TextEditingController();
  RxList<String> gender = RxList<String>(["Male","Female"]);
  RxString select='Male'.obs;
  // RxList<PData> petList = RxList<PData>([]);
  PData? pData;
  GetPetModel getPetModel =GetPetModel();

  List respons=[];

  @override
  void onInit() {
    super.onInit();
    GetPet();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  GetPet() async {
    var url = Uri.parse(baseUrl + ApiConstant.pet+"/${data.pet}");
    var response = await http.get(url,headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    dynamic result = jsonDecode(response.body);
    getPetModel = GetPetModel.fromJson(result);
    if (!isNullEmptyOrFalse(getPetModel.data)) {
      pData = getPetModel.data;
    }
  }

  Future<void> UpdatePet() async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
       print('sid==>${pData!.sId}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl+ApiConstant.pet+"/${pData!.sId}"));
      request.body = json.encode({
          "name": "${name}",
          "age": "${age}",
          "breed": "${breed}",
          "gender": "${select}"
      });
       request.headers.addAll(headers);
      http.StreamedResponse? response ;
      await request.send().then((value){
        response = value;
      });
      if (response!.statusCode == 200) {
        Get.snackbar("Success","Pet Update",snackPosition: SnackPosition.BOTTOM);
      }
      else {
        Get.snackbar("Success",response!.reasonPhrase.toString(),snackPosition: SnackPosition.BOTTOM);
        print(response!.reasonPhrase);
      }
    }catch(e){
      Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,);

    }
  }
}
