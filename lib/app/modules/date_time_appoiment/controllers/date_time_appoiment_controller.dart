import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waggs_app/app/Modal/GetPetModel.dart';
import 'package:waggs_app/app/Modal/VetDetailModel.dart';

import '../../../../main.dart';
import '../../../../utilities/custome_dialogs.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../routes/app_pages.dart';

class DateTimeAppoimentController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool hasData = false.obs;
  TabController? tabController;
  TextEditingController des = TextEditingController();
  Dio dio = Dio();
  Rx<DateTime> time = DateTime.now().obs;
  Rx<DateTime> date = DateTime.now().obs;
  dynamic Argument = Get.arguments;
  @override
  void onInit() {
   print('${Argument[0]}');
   print('${Argument[1]}');
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController!.dispose();
  }

  bookvet({required BuildContext context}) {
    DateTime selecteddateTime = DateTime(date.value.year, date.value.month,
        date.value.day, time.value.hour, time.value.minute, time.value.second);
    getIt<CustomDialogs>().showCircularDialog(context);
    Map<String, dynamic> dict = {};
    dict["date"] = selecteddateTime.toUtc().toString();
    dict["note"] = des.text;
    dict["pet"] = "${Argument[0]}";
    dict["vet"] = "${Argument[1]}";
    print("My Map : = $dict");
    dio
        .post(
      baseUrl + ApiConstant.bookvet,
      data: dict,
      options: Options(headers: {
        'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      }),
    )
        .then((value) {
      getIt<CustomDialogs>().hideCircularDialog(context);
      Get.offAndToNamed(Routes.PET_VIEW_DETAILS, arguments: Argument[0]);
      print("VALUE  : = ${value}");
    }).catchError((error) {
      getIt<CustomDialogs>().hideCircularDialog(context);
      print("ERROR : = $error");
    });
  }
}
