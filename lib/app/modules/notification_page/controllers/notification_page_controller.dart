import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waggs_app/app/Modal/NotificationDataModel.dart';

import '../../../../main.dart';
import '../../../../utilities/custome_dialogs.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';
import 'package:http/http.dart' as http;

class NotificationPageController extends GetxController {
  //TODO: Implement NotificationPageController

  final count = 0.obs;
  RxBool hasNotificationCount = false.obs;
  RxList<Notifications> notificationList = RxList();
  @override
  void onInit() {
    super.onInit();
    getNotificationData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getNotificationData() async {
    // https://api-stg.waggs.in/api/v1/notification/list?skip=0&limit=10
    hasNotificationCount.value = false;
    var url = Uri.parse(baseUrl + ApiConstant.notificationList);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      'Content-Type': 'application/json',
    });
    print('response status:${response.body}');
    notificationList.clear();
    hasNotificationCount.value = true;

    dynamic result = jsonDecode(response.body);
    NotificationDataModel count1 = NotificationDataModel.fromJson(result);
    print(result);

    if (!isNullEmptyOrFalse(count1.data)) {
      if (!isNullEmptyOrFalse(count1.data!.notifications)) {
        notificationList.addAll(count1.data!.notifications ?? []);
      }
    } else {}
  }

  removeNotification(
      {required BuildContext context,
      bool isFromLoading = false,
      String? notificationId}) async {
    getIt<CustomDialogs>().showCircularDialog(context);
    var url = Uri.parse(
        baseUrl + ApiConstant.deleteNotifications + "${notificationId}");
    var response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    getIt<CustomDialogs>().hideCircularDialog(context);

    if (response.statusCode == 200) {
      getNotificationData();
    } else {
      getMySnackBar(
          context: context,
          title: "Error",
          message: "Something Went Wrong....",
          backColor: Colors.red);
    }
  }

  removeAllNotification(
      {required BuildContext context,
      bool isFromLoading = false,
      String? notificationId}) async {
    getIt<CustomDialogs>().showCircularDialog(context);
    var url = Uri.parse(baseUrl + ApiConstant.deleteAllNotifications);
    var response = await http.delete(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    getIt<CustomDialogs>().hideCircularDialog(context);

    if (response.statusCode == 200) {
      getNotificationData();
    } else {
      getMySnackBar(
          context: context,
          title: "Error",
          message: "Something Went Wrong....",
          backColor: Colors.red);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
