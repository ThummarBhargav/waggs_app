import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/constant/ConstantUrl.dart';

class OTPScreenController extends GetxController {
  //TODO: Implement OTPScreenController

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

  Future<void> otpApi()
  async {
    var url = Uri.parse(baseUrl+ApiConstant.verifyOtpUsers);
    var response = await http.post(url, body: {'email': 'khilanvithani0080@gmail.com',
      'countryCode': '+91', 'mobile': '8320915951' ,'otp':'098765'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<void> signupApi()
  async {
    var url = Uri.parse(baseUrl+ApiConstant.verifyOtpUsers);
    var response = await http.post(url, body: {
      'name': '',
      'mobile': '',
      'countryCode': '+91',
      'email': 'khilanvithani0080@gmail.com',
      'password':''});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

}
