import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const baseUrl = "https://api-stg.waggs.in/api/v1/";
const baseUrl3 = "https://api-stg.waggs.in/api/v1/users/";

class ApiConstant {
  static const signUpUsers = "signup";
  static const socialLoginApi = "https://api.waggs.in/api/v1/users/socialLogin";
  static const paymentKey = "rzp_test_pfJrUULLPTmEYK";
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
// static const getpet = "pet/list?skip=0&limit=20";
  static const getvet = "vet";
  static const vetdetail = "vet/info/";
  static const bookvet = "appointment/book";
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
}

getMySnackBar(
    {required BuildContext context,
    required String title,
    required String message,
    Color backColor = Colors.green}) {
  return Get.snackbar(title, message,
      backgroundColor: backColor, snackPosition: SnackPosition.BOTTOM);
}
