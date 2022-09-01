import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'app/routes/app_pages.dart';
GetStorage box = GetStorage();
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocationPermission permission = await Geolocator.checkPermission() ;
  if(permission == LocationPermission.denied||permission == LocationPermission.deniedForever||permission == LocationPermission.unableToDetermine){
    await Geolocator.requestPermission();
  }

 await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
