import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  User? user;
  List respons = [];
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




  //  signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //
  //   try {
  //     final UserCredential userCredential =
  //     await _auth.signInWithCredential(credential);
  //
  //     user = userCredential.user;
  //    // await Get.offAllNamed(Routes.HOME);
  //
  //     } on FirebaseAuthException catch (e) {
  //     if (e.code == 'account-exists-with-different-credential') {
  //       Get.snackbar("Sign in Failed","The account already exists with a different credential.");
  //
  //     } else if (e.code == 'invalid-credential') {
  //       Get.snackbar("Sign in Failed","Error occurred while accessing credentials. Try again.");
  //
  //     }
  //   } catch (e) {
  //     Get.snackbar("Sign in Failed","Error occurred using Google Sign-In. Try again.");
  //
  //   }
  //   // return await FirebaseAuth.instance.signInWithCredential(credential).then((value) async => await Get.offAllNamed(Routes.HOME)).catchError((error){
  //   //   Get.snackbar("Sign in Failed", error.toString());
  //   // });
  // }

   Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.snackbar("Sign in Failed", "The account already exists with a different credential.");


        } else if (e.code == 'invalid-credential') {
          Get.snackbar("Sign in Failed", "Error occurred while accessing credentials. Try again.");

        }
      } catch (e) {
        Get.snackbar("Sign in Failed", "Error occurred using Google Sign-In. Try again.");

      }
    }

    return user;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    late LoginResult loginResult ;
    await FacebookAuth.instance.login(permissions: ['email']).then((value) {
      loginResult = value;
    }).catchError((error){
      print("Error := $error");
    });
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }


  Future<void> LoginUser() async {
    try {
      var url = Uri.parse(baseUrl2 + ApiConstant.loginUsers);
      var response = await http.post(url, body: {
        'email': '${emailController.value.text.trim()}',
        'password': '${passController.value.text.trim()}',
      });
      respons.add(response.body);
      print(jsonDecode(response.body).runtimeType);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        LoginModel res = LoginModel.fromJson(jsonDecode(response.body));
        if (res.responseCode == 200) {
          if (!isNullEmptyOrFalse(res.data)) {
            if (!isNullEmptyOrFalse(res.data!.token)) {
              box.write(ArgumentConstant.token, res.data!.token);
              box.write(ArgumentConstant.isUserLogin, true);
              box.write(ArgumentConstant.email, res.data!.user!.email);
              box.write(ArgumentConstant.userid, res.data!.user!.sId);
              box.write(ArgumentConstant.name, res.data!.user!.name);
              box.write(
                  ArgumentConstant.countryCode, res.data!.user!.countryCode);
              box.write(ArgumentConstant.address, res.data!.user!.address);
              box.write(ArgumentConstant.phone, res.data!.user!.mobile);
              Get.offAllNamed(Routes.HOME);
              print(box.read(ArgumentConstant.isUserLogin));
            }
          }
        }
      } else {
        LoginModel res = LoginModel.fromJson(jsonDecode(response.body));
        Get.snackbar("Error", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
