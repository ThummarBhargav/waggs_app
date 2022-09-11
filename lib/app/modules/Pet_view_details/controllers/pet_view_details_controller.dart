import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waggs_app/app/Modal/appointments_models.dart';
import 'package:waggs_app/app/Modal/view_pet_details_models.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:http/http.dart' as http;
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/main.dart';

class PetViewDetailsController extends GetxController {
  //TODO: Implement PetViewDetailsController
  RxBool hasData = false.obs;
  RxBool hasData1 = false.obs;
  PetData petData = PetData();
  RxList<Appointments> appointmentslist = RxList([]);
  Appointments1 appointments1 = Appointments1();
  @override
  void onInit() {
    var Data1 = Get.arguments;
    MyPet(context: Get.context!);
    appointmentApi(context: Get.context!);
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

  MyPet({required BuildContext context, bool isFromLoading = false}) async {
    var url = Uri.parse(baseUrl + ApiConstant.getpet + "${Get.arguments}");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData.value = true;
    if (response.statusCode == 200) {
      pet1 res = pet1.fromJson(jsonDecode(response.body));
      if (!isNullEmptyOrFalse(res)) {
        if (!isNullEmptyOrFalse(res.data)) {
          petData = res.data!;
        }
      }
    }
  }

  dilogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            content: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Call to book your appointment",
                    style: GoogleFonts.publicSans(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "+91 9741588018",
                    style: GoogleFonts.publicSans(
                      color: Color(0xffeb9d4f),
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pet Id: ${petData.uniqueNo}",
                    style: GoogleFonts.publicSans(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          child: ElevatedButton(
                        onPressed: () async {
                          const url = 'tel:9741588018';
                          await launch(url);
                        },
                        child: Text("Call Now"),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  appointmentApi(
      {required BuildContext context, bool isFromLoading = false}) async {
    var url = Uri.parse(
        "https://api-stg.waggs.in/api/v1/appointment/list?skip=0&limit=15&petId=${Get.arguments}&status=&search=");
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${box.read(ArgumentConstant.token)}',
    });
    hasData1.value = true;
    dynamic result = jsonDecode(response.body);
    appointments1 = Appointments1.fromJson(result);
    if (response.statusCode == 200) {
      if (!isNullEmptyOrFalse(appointments1)) {
        if (!isNullEmptyOrFalse(appointments1.data!.appointments)) {
          appointments1.data!.appointments!.forEach((element) {
            appointmentslist.add(element);
          });
        }
      }
    }
  }
}
