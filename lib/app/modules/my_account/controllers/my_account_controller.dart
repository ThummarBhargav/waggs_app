import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/ErrorResponse.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';
import '../../../Modal/updateAddressResponseModel.dart';
import '../../../constant/SizeConstant.dart';
import '../../../routes/app_pages.dart';

class MyAccountController extends GetxController {
  //TODO: Implement MyAccountController

  TextEditingController name = TextEditingController();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passController = TextEditingController().obs;
  Rx<TextEditingController> shopController = TextEditingController().obs;
  Rx<TextEditingController> buildingNameController =
      TextEditingController().obs;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List respons = [];
  Rx<Position>? _currentPosition;
  String _currentAddress = '';
  RxString newLocation = "".obs;
  RxBool isLocationChanged = false.obs;
  Geolocator geolocator = Geolocator();
  @override
  void onInit() {
    // getCurrentLocation();
    super.onInit();
  }

  Future<Position?> getCurrentLocation() async {
    Position? currentPositionData;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) {
      _currentPosition = position.obs;
      currentPositionData = position;
      print("position: ====== ${position.latitude} ==> ${position.longitude}");
    }).catchError((e) {
      print(e);
    });

    return currentPositionData;
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = [];
      await placemarkFromCoordinates(_currentPosition!.value.latitude,
              _currentPosition!.value.longitude)
          .then((value) {
        placemarks.clear();
        placemarks.addAll(value);
      });
      Placemark place = placemarks[0];
      _currentAddress =
          "${place.street} ${place.subLocality} ${place.locality}, ${place.postalCode}, ${place.country}";
      print("CurrentAddress====================" +
          "${place.street} ${place.subLocality} ${place.locality}, ${place.postalCode}, ${place.country}");
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> sendOtp() async {
    var url = Uri.parse(baseUrl3 + ApiConstant.sendOtpUsers);
    await http.post(url, body: {
      'countryCode': '${box.read(ArgumentConstant.countryCode)}',
      'email': 'forgot',
      'mobile': '${box.read(ArgumentConstant.phone)}',
    }).then((value) {
      if (value.statusCode == 200) {
        Get.toNamed(Routes.MY_ACCOUNT_CHANGE_PASSWORD);
      } else {
        ErrorResponse res = ErrorResponse.fromJson(jsonDecode(value.body));
        Get.snackbar("Error", res.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red);
      }
      print('Response status: ${value.statusCode}');
      print('Response body: ${value.body}');
    }).catchError((error) {
      print(error);
    });
  }

  dialogBox(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Select address",
                      style: GoogleFonts.publicSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (input) => !isNullEmptyOrFalse(input)
                            ? null
                            : "Please Enter Address",
                        decoration: InputDecoration(
                          hintText: "Search for area",
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      // getCurrentLocation();
                      print(
                          "latitude===============${_currentPosition!.value.latitude}");
                      print(
                          "longitude===============${_currentPosition!.value.longitude}");
                      _getAddressFromLatLng();
                      Address1(context);
                    },
                    child: Container(
                      height: 75,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.my_location,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                            height: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Get Current location",
                                style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(33, 43, 54, 1)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Using gps",
                                style: GoogleFonts.publicSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(99, 115, 129, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.publicSans(
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(31, 193, 244, 1),
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> updateAddressApi() async {
    var url = Uri.parse(baseUrl3 + ApiConstant.addressUpdate);
    await http.put(url, body: {
      'address': shopController.value.text +
          " " +
          buildingNameController.value.text +
          " " +
          _currentAddress,
      'latitude': _currentPosition!.value.latitude.toString(),
      'longitude': _currentPosition!.value.longitude.toString(),
    }, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
      // 'Content-Type': 'application/json'
    }).then((value) {
      shopController.value.clear();
      buildingNameController.value.clear();
      if (value.statusCode == 200) {
        UpdateAddressModel res =
            UpdateAddressModel.fromJson(jsonDecode(value.body));
        box.write(ArgumentConstant.address, res.data!.address ?? "");
        newLocation.value = res.data!.address ?? "";
        isLocationChanged.value = true;
      }
      print('Response status: ${value.statusCode}');
      print('Response body: ${value.body}');
    }).catchError((error) {
      print(error);
    });
  }

  Address1(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 300,
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Enter full address",
                        style: GoogleFonts.publicSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Spacer(),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Expanded(
                          child: Text(
                            "${_currentAddress}",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: shopController.value,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter shop no";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Shop / Building / Flat no.",
                        labelText: "Shop / Building / Flat no.*",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: buildingNameController.value,
                      decoration: InputDecoration(
                        hintText:
                            "Shop / Building Name / Society Name (Optional)",
                        labelText: "Shop / Building Name / Society Name",
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(31, 193, 244, 1),
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            if (formkey.currentState!.validate()) {
                              Get.back();
                              Get.back();
                              updateAddressApi();
                            }
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: Text(
                                "Save",
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(31, 193, 244, 1),
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
