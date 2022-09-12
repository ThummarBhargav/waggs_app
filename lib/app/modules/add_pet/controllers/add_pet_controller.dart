import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';
import 'package:waggs_app/app/Modal/create_image_slot_model.dart';
import 'package:waggs_app/app/Modal/updatepet1model.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/utilities/custome_dialogs.dart';
import '../../../../main.dart';
import 'package:path/path.dart' as p;
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class AddPetController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController breed = TextEditingController();
  RxList<String> gender = RxList<String>(["MALE", "FEMALE"]);
  RxString select = 'MALE'.obs;
  RxString imageUrl = ''.obs;
  ImagePicker picker = ImagePicker();
  Rx<XFile>? pickedFile;
  RxBool isImagePicked = false.obs;
  RxBool hasData = false.obs;
  String patId = "";
  Dio dio = Dio();
  List respons = [];

  @override
  void onInit() {
    if (!isNullEmptyOrFalse(Get.arguments)) {
      if (!isNullEmptyOrFalse(Get.arguments[ArgumentConstant.patId])) {
        patId = Get.arguments[ArgumentConstant.patId];
      }
    }
    getPet(context: Get.context!);
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

  getPet({required BuildContext context}) async {
    hasData.value = false;
    dio
        .get(
      baseUrl + ApiConstant.pet + "/$patId",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
        },
      ),
    )
        .then((value) {
      hasData.value = true;
      if (!isNullEmptyOrFalse(value)) {
        UpdatePet res = UpdatePet.fromJson(value.data);
        if (!isNullEmptyOrFalse(res.data)) {
          if (!isNullEmptyOrFalse(res.data!.name)) {
            name.text = res.data!.name!;
            age.text = res.data!.age!;
            breed.text = res.data!.breed!;
            imageUrl.value = res.data!.image!;
          }
          if (!isNullEmptyOrFalse(res.data!.gender)) {
            select.value = res.data!.gender.toString().toUpperCase();
          }
        }
      }
    }).catchError((error) {
      hasData.value = true;
      getMySnackBar(
          context: context,
          title: "Error",
          message: "Something Went Wrong....",
          backColor: Colors.red);
    });
  }

  updatePet({required BuildContext context}) {
    getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["name"] = name.text;
    dict["age"] = age.text;
    dict["breed"] = breed.text;
    dict["gender"] = select.value.toLowerCase();
    dict["image"] = imageUrl.value;
    dio
        .put(
      baseUrl + ApiConstant.updatePet + patId,
      data: dict,
      options: Options(headers: {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      }),
    )
        .then((value) {
      getIt<CustomDialogs>().hideCircularDialog(context);
      Get.toNamed(Routes.MY_PET);
      print("VALUE  : = ${value}");
    }).catchError((error) {
      getIt<CustomDialogs>().hideCircularDialog(context);

      print("ERROR : = $error");
    });
  }

  createImageSlot({required BuildContext context}) async {
    getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    String fileName = p.basenameWithoutExtension(pickedFile!.value.path);
    List<int> imageData = await pickedFile!.value.readAsBytes();
    dict["file"] = (!isNullEmptyOrFalse(pickedFile))
        ? await MultipartFile.fromBytes(imageData, filename: fileName)
        : "";
    FormData formData = FormData.fromMap(dict);
    dio
        .post(
      baseUrl + ApiConstant.createImageSlot,
      data: formData,
    )
        .then((value) {
      getIt<CustomDialogs>().hideCircularDialog(context);
      if (!isNullEmptyOrFalse(value)) {
        CreateImageSlotModel res = CreateImageSlotModel.fromJson(value.data);
        if (!isNullEmptyOrFalse(res.data)) {
          if (!isNullEmptyOrFalse(res.data!.file)) {
            if (!isNullEmptyOrFalse(res.data!.file!.url)) {
              imageUrl.value = res.data!.file!.url!;
            }
          }
        }
      }
      print("VALUE : = $value");
    }).catchError((error) {
      getIt<CustomDialogs>().hideCircularDialog(context);
      DioError dioError = error as DioError;
      if (!isNullEmptyOrFalse(dioError.response)) {
        if (!isNullEmptyOrFalse(dioError.response!.data)) {
          getMySnackBar(
              context: context,
              title: "Error",
              message: "${dioError.response!.data["message"]}",
              backColor: Colors.red);
          print(dioError.response!.data["message"]);
        }
      }
      print("ERROR : = $error");
    });
  }
}
