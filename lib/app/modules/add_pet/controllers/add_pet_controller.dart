import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';
import '../../../Modal/PetModel.dart';
import '../../../constant/ConstantUrl.dart';

class AddPetController extends GetxController {
  //TODO: Implement AddPetController

  TextEditingController name = TextEditingController(text: 'New Pet');
  TextEditingController Gender = TextEditingController(text: 'New Pet');
  TextEditingController age = TextEditingController();
  TextEditingController breed = TextEditingController();
  RxList<String> gender = RxList<String>(["Male","Female"]);
  RxString select='Male'.obs;
  RxList<PetData> petList = RxList<PetData>([]);
  List respons=[];
  PetModel petModel = PetModel();

  @override
  void onInit() {
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



  Future<void> UpdatePet() async {
    print('Bearer ${box.read(ArgumentConstant.token)}');
      print('sid==>${data}');
    try{
      var headers = {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        'Content-Type': 'application/json'
      };
      var request = http.Request('PUT', Uri.parse(baseUrl+ApiConstant.pet));
      request.body = json.encode({
          "name": "${name}",
          "age": "${age}",
          "breed": "${breed}",
          "gender": "${select}",
          "image":""
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
