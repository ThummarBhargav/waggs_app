import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:linkedin_login/linkedin_login.dart';
import 'package:waggs_app/app/Modal/login_model.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/modules/home/views/home_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/main.dart';
import '../../../Modal/ErrorResponse.dart';
import '../../../Modal/sign_up_response_model.dart';
import '../../../constant/ConstantUrl.dart';

class LoginScreenController extends GetxController {
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;

  RxBool isNumberExist = false.obs;
  RxBool isChecked = false.obs;
  RxBool isTap = false.obs;
  late Timer timer;
  bool logoutUser = false;

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

  // signInWithLinkedin()async{
  //     LinkedInUserWidget(
  //       destroySession: logoutUser,
  //       redirectUrl: "https://waggs.in/",
  //       clientId: "78buicazyv5os8",
  //       clientSecret: "DjMTZ6XgYSxBQkal",
  //       projection: [
  //         ProjectionParameters.id,
  //         ProjectionParameters.localizedFirstName,
  //         ProjectionParameters.localizedLastName,
  //         ProjectionParameters.firstName,
  //         ProjectionParameters.lastName,
  //         ProjectionParameters.profilePicture,
  //       ],
  //       onGetUserProfile: (final UserSucceededAction linkedInUser) {
  //
  //         user = UserObject(
  //           firstName: linkedInUser.user.firstName?.localized?.label,
  //           lastName: linkedInUser.user.lastName?.localized?.label,
  //           email: linkedInUser?.user?.email?.elements![0]
  //               ?.handleDeep?.emailAddress,
  //           profileImageUrl: linkedInUser
  //               ?.user
  //               ?.profilePicture
  //               ?.displayImageContent
  //               ?.elements![0]
  //               ?.identifiers![0]
  //               ?.identifier,
  //         );
  //
  //       },
  //     );
  // }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    auth.signOut();
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
        UserCredential? userCredential;
        await auth.signInWithCredential(credential).then((value) async {
          userCredential = value;

          user = userCredential!.user;

          await socialLoginApi(
              socialId: value.user!.uid,
              socialType: "facebook",
              isForGoogle: true,
              userGoogleData: user);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.snackbar("Sign in Failed",
              "The account already exists with a different credential.");
        } else if (e.code == 'invalid-credential') {
          Get.snackbar("Sign in Failed",
              "Error occurred while accessing credentials. Try again.");
        }
      } catch (e) {
        Get.snackbar("Sign in Failed",
            "Error occurred using Google Sign-In. Try again.");
      }
    }

    return user;
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    late LoginResult loginResult;
    await FacebookAuth.instance
        .login(permissions: ['email']).then((value) async {
      loginResult = value;
      if (!isNullEmptyOrFalse(loginResult.accessToken)) {
        if (!isNullEmptyOrFalse(loginResult.accessToken!.userId)) {
          box.write(
              ArgumentConstant.facebookUserId, loginResult.accessToken!.userId);
          await socialLoginApi(
              socialId: loginResult.accessToken!.userId,
              socialType: "facebook",
              isForFacebook: true,
              userFacebookData: loginResult);
        }
      }
    }).catchError((error) {
      print("Error := $error");
    });
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  linkedInLogin({required BuildContext context}) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LinkedInUserWidget(
          appBar: AppBar(
            title: Text("Linkedin"),
          ),
          redirectUrl: "https://stg.waggs.in/linkedin",
          clientId: "78buicazyv5os8",
          clientSecret: "DjMTZ6XgYSxBQkal",
          onGetUserProfile: (UserSucceededAction linkedInUser) async {
            print("Maja response := ${linkedInUser.user.userId}");
            if (!isNullEmptyOrFalse(linkedInUser.user.userId)) {
              await socialLoginApi(
                  socialId: linkedInUser.user.userId!,
                  socialType: "linkedin",
                  isForLinkedIn: true,
                  userLinkedInData: linkedInUser);
            }
          },
        ),
        fullscreenDialog: true,
      ),
    );
  }

  socialLoginApi(
      {required String socialId,
      required String socialType,
      UserSucceededAction? userLinkedInData,
      LoginResult? userFacebookData,
      User? userGoogleData,
      bool isForFacebook = false,
      bool isForLinkedIn = false,
      bool isForGoogle = false}) async {
    Dio dio = Dio();
    await dio.post(ApiConstant.socialLoginApi, data: {
      "socialId": socialId,
      "socialType": socialType,
    }).then((value) {
      print("My Response :=  $value");
      if (!isNullEmptyOrFalse(value)) {
        box.write(ArgumentConstant.isUserLogin, true);
        Get.offAllNamed(Routes.HOME);
      }
    }).catchError((error) {
      DioError dioError = error as DioError;
      print(dioError);
      if (!isNullEmptyOrFalse(dioError.response)) {
        if (dioError.response!.statusCode == 404) {
          Get.toNamed(Routes.MOBILE_VERIFY, arguments: {
            ArgumentConstant.isFromLinkedinLogin: isForLinkedIn,
            ArgumentConstant.isFromFacebookLogin: isForFacebook,
            ArgumentConstant.isFromGoogleLogin: isForGoogle,
            ArgumentConstant.userData: (isForFacebook)
                ? userFacebookData
                : (isForGoogle)
                    ? userGoogleData
                    : userLinkedInData,
          });
        }
      }

      print("Error := $error");
    });
  }

  Future<void> LoginUser() async {
    try {
      var url = Uri.parse(baseUrl3 + ApiConstant.loginUsers);
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

  Future<void> signUp(
      {String? countryCode,
      String? email,
      String? mobile,
      String? name,
      String? socialId,
      String? socialType,
      required BuildContext context}) async {
    try {
      var url = Uri.parse(baseUrl3 + ApiConstant.signUpUsers);
      var response;
      await http.post(url, body: {
        "name": "${name}",
        "mobile": "${mobile}",
        "countryCode": "${countryCode}",
        "email": "${email}",
        "socialId": "${socialId}",
        "socialType": "${socialType}"
      }).then((value) {
        print(value.body);
        response = value;
        if (response.statusCode == 200) {
          SignUpResponseModel res =
              SignUpResponseModel.fromJson(jsonDecode(response.body));
          showDialog(
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/tick.png"),
                          ),
                        ),
                      ),
                      Text(
                        "Success",
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  content: Text(
                      "Sign up Successful. Check email for email verification."),
                  titleTextStyle: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  contentTextStyle: GoogleFonts.raleway(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN_SCREEN);
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(32, 193, 244, 1),
                          ),
                        ))
                  ],
                );
              },
              context: context);
        } else {
          ErrorResponse res = ErrorResponse.fromJson(jsonDecode(response.body));
          Get.snackbar("Error", res.message.toString());
        }
      }).catchError((error) {
        print(error);
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class UserObject {
  UserObject({
    this.firstName,
    this.lastName,
    this.email,
    this.profileImageUrl,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImageUrl;
}
