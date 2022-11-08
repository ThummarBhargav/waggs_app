import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;
import 'package:waggs_app/app/constant/SizeConstant.dart';
// Live
// const baseUrl = "https://api.waggs.in/api/v1/";
// const baseUrl1 = "api.waggs.in";
// const baseUrl3 = "https://api.waggs.in/api/v1/users/";

// Stg
const baseUrl = "https://api-stg.waggs.in/api/v1/";
const baseUrl1 = "api-stg.waggs.in";
const baseUrl3 = "https://api-stg.waggs.in/api/v1/users/";

class ApiConstant {
  static const signUpUsers = "signup";
  static const shipping = "app-settings";
  static const socialLoginApi = "socialLogin";
  static const paymentKey = "rzp_live_Xq7fXupLzqC8rT";
  static const loginUsers = "login";
  static const logoutUsers = "logout";
  static const verifyEmailUsers = "verifyEmail";
  static const sendOtpUsers = "sendOtp";
  static const verifyOtpUsers = "verifyOtp";
  static const verifyExistsUsers = "verifyExists";
  static const verifyOtpNewPassword = "verifyOtpNewPassword";
  static const changePassword = "changePassword";
  static const bannerProductUsers = "banner";
  static const getAllProductUsers = "products";
  static const AllCategory = "category";
  static const AllSubCategory = "subcategory";
  static const TopStore = "landing?latitude=&longitude=";
  static const alsoLike = "products";
  static const Cart = "cart";
  static const pet = "pet";
  static const Count = "cart/count";
  static const notificationCount = "notification/count";
  static const notificationList = "notification/list";
  static const socialLogin = "users/socialLogin";
  static const orderlist = "order/list?skip=0&limit=15";
  static const checkout = "transaction/checkout";
  static const Plans = "subscription/plans";
  static const PlansPlayment = "transaction/subscription";
  static const transcation = "transaction";
  static const AddPet = "pet/list?skip=0&limit=20";
  static const orderDetail = "order/find/";
  static const getpet = "pet/";
  static const deleteNotifications = "notification/dismiss/";
  static const deleteAllNotifications = "notification/all";
  static const createImageSlot = "file/";
  static const updatePet = "pet/";
  static const orderCancel = "order/";
  static const appointment = "appointment/";
  static const linkedLoginApi = "linkedIn-login";
  static const coupon = "cart/apply-coupon/";
  static const getvet = "vet";
  static const vetdetail = "vet/info/";
  static const bookvet = "appointment/book";
  static const addressUpdate = "address";
  static const deleteUser = "account";
}

class ArgumentConstant {
  static String token = "token";
  static String token1 = "token1";
  static String email = "email";
  static String userid = "userId";
  static String countryCode = "countryCode";
  static String name = "name";
  static String phone = "phone";
  static String address = "address";
  static const isUserLogin = "isUserLogin";
  static String isFromSellingStore = "isFromSellingStore";
  static String isFromTopProducts = "isFromTopProducts";
  static String isFromSubCategory = "isFromSubCategory";
  static String sellerList = "sellerList";
  static String TopProductlist = "TopProductlist";
  static String subcategoryData = "subcategoryData";
  static String orderData = "OrderData";
  static String permission = "permission";
  static String isFromFacebookLogin = "isFromFacebookLogin";
  static String isFromGoogleLogin = "isFromGoogleLogin";
  static String isFromLinkedinLogin = "isFromLinkedinLogin";
  static String isFromMobile = "isFromMobile";
  static String facebookUserId = "facebookUserId";
  static String userData = "userData";
  static String socialId = "socialId";
  static String socialType = "socialType";
  static String mobile = "mobile";
  static String orderId = "orderId";
  static String patId = "patId";
  static String isFromDrawer = "isFromDrawer";
  static String searchProduct = "searchProduct";
}

Rx<Position>? _currentPosition;
Future<Position> getCurrentLocation() async {
  loc.Location location = loc.Location();
  loc.LocationData data = await location.getLocation();
  print(data.latitude);
  Position? currentPositionData;
  // await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high,
  //         forceAndroidLocationManager: true)
  //     .whenComplete(() {
  //   print("object");
  // }).then((Position position) {
  //   _currentPosition = position.obs;
  //   currentPositionData = position;
  //   print("position: ====== ${position.latitude} ==> ${position.longitude}");
  // }).catchError((e) {
  //   print(e);
  // });
  if (isNullEmptyOrFalse(currentPositionData)) {
    currentPositionData = Position(
        longitude: data.longitude!,
        latitude: data.latitude!,
        timestamp: DateTime.now(),
        accuracy: data.accuracy!,
        altitude: data.altitude!,
        heading: data.heading!,
        speed: data.speed!,
        speedAccuracy: data.speedAccuracy!);
  }

  return currentPositionData!;
}

getMySnackBar(
    {required BuildContext context,
    required String title,
    required String message,
    Color backColor = Colors.green}) {
  return Get.snackbar(title, message,
      backgroundColor: backColor, snackPosition: SnackPosition.BOTTOM);
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}
