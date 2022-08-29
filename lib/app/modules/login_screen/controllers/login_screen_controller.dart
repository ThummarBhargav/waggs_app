import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/Modal/login_model.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/modules/home/views/home_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/main.dart';
import '../../../constant/ConstantUrl.dart';

class LoginScreenController extends GetxController {

  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
  RxBool isChecked = false.obs;
  RxBool passwordVisible = true.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  Rx<User>? _firebaseUser;

  List respons =[];
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

  // void google_signIn() async{
  //    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;
  //    AuthCredential credential = GoogleAuthProvider.credential(
  //      idToken: googleAuth.idToken,
  //      accessToken: googleAuth.accessToken,
  //    );
  //    User user = (await _auth.signInWithCredential(credential).then((value) async=> await  Get.offAndToNamed(Routes.HOME)));
  // }
  Future<UserCredential> signInWithGoogle() async {
    await google_signout();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then((value) async  => await Get.offAllNamed(Routes.HOME));
  }
  Future google_signout() async{
    await googleSignIn.signOut();
  }



  Future<void> LoginUser() async {
    try{
      var url = Uri.parse(baseUrl2+ApiConstant.loginUsers);
      var response = await http.post(url, body: {
        'email': '${emailController.value.text.trim()}',
        'password': '${passController.value.text.trim()}',
      }
      );
      respons.add(response.body);
      print(jsonDecode(response.body).runtimeType);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(response.statusCode==200){
        LoginModel res  = LoginModel.fromJson(jsonDecode(response.body));
        if(res.responseCode == 200){
          if(!isNullEmptyOrFalse(res.data)){
            if(!isNullEmptyOrFalse(res.data!.token)){
              box.write(ArgumentConstant.token, res.data!.token);
              box.write(ArgumentConstant.isUserLogin, true);
              box.write(ArgumentConstant.email, res.data!.user!.email);
              box.write(ArgumentConstant.name, res.data!.user!.name);
              box.write(ArgumentConstant.address, res.data!.user!.address);
              box.write(ArgumentConstant.phone, res.data!.user!.mobile);
               Get.offAllNamed(Routes.HOME);
              print(box.read(ArgumentConstant.isUserLogin));
            }
          }
        }
      }
      else{
        LoginModel res  = LoginModel.fromJson(jsonDecode(response.body));
        Get.snackbar("Error", res.message.toString(),snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red,colorText: Colors.white);
      }
    }catch(e){
    Get.snackbar("Error", e.toString(),snackPosition: SnackPosition.BOTTOM,);
    }
  }


}
