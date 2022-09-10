import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';

import '../controllers/pet_view_details_controller.dart';

class PetViewDetailsView extends GetWidget<PetViewDetailsController> {
  const PetViewDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
            body: SingleChildScrollView(
          child: (controller.hasData.isFalse)
              ? Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                )
              : Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                          Icons.keyboard_backspace_outlined))
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // SizedBox(width: 200,),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.search,
                                        size: 25,
                                        color: Colors.grey,
                                      )),

                                  Stack(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.shopping_cart,
                                            size: 25,
                                            color: Colors.grey[500],
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 10.0, top: 10),
                                child: getcon(
                                  color: Colors.orange,
                                  text: Text(
                                    "Book Salon",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 120,
                                  height: 45,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.grey[200],
                          margin: EdgeInsets.only(top: 10),
                          height: 300,
                          width: 360,
                          child: getImageByLink(
                            url: controller.petData.image.toString(),
                            boxFit: BoxFit.cover,
                            height: 100,
                            width: 150,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 30),
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            textAlign: TextAlign.start,
                            "${controller.petData.name}",
                            style: TextStyle(
                                color: Color.fromRGBO(32, 193, 244, 1),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange, width: 2),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      "Pet Id",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      "${controller.petData.uniqueNo}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      "${controller.petData.gender!.toUpperCase()}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      "Age",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  controller.petData.age == null
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            " years old",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            "${controller.petData.age} years old",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text(
                                      "Breed",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  controller.petData.age == null
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            "${controller.petData.breed}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                textAlign: TextAlign.start,
                                "Subscription Plan:",
                                style: TextStyle(
                                    color: Color.fromRGBO(32, 193, 244, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                "${controller.petData.subscription!.planId!.toUpperCase()}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                DateFormat("MM/dd/yyyy").format(
                                  DateTime.parse(
                                      "${controller.petData.subscription!.createdAt}"),
                                ),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 128, 0, 1),
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                "To",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 128, 0, 1),
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                DateFormat("MM/dd/yyyy").format(
                                  DateTime.parse(
                                      "${controller.petData.subscription!.expiryDate}"),
                                ),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(0, 128, 0, 1),
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: getcon(
                                  color: Color.fromRGBO(0, 128, 0, 1),
                                  text: Text(
                                    "Active",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 120,
                                  height: 50,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: getcon(
                                  color: Colors.orange,
                                  text: Text(
                                    "Book Vet Appointment",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 200,
                                  height: 40,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(32, 193, 244, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        color: Color.fromRGBO(32, 193, 244, 1),
                                      ))),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(32, 193, 244, 1),
                                      width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Color.fromRGBO(32, 193, 244, 1),
                                      ))),
                            ),
                            Spacer(),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: Text(
                                "Remaining appointments :",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              child: Text(
                                "${controller.petData.remainingAppointments}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
        ));
      }),
    );
  }
}
