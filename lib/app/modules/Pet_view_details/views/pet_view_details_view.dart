import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/app/modules/cart_drawer/views/cart_drawer_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../controllers/pet_view_details_controller.dart';

class PetViewDetailsView extends GetWidget<PetViewDetailsController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  PetViewDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: SafeArea(
      child: Obx(() {
        return Scaffold(
            key: scaffoldKey,
            endDrawer: Drawer(
              child: CartDrawerView(),
            ),
            body: (controller.hasData.isFalse)
                ? Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  )
                : SingleChildScrollView(
                    child: Column(
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
                                            Get.offAndToNamed(Routes.MY_PET);
                                          },
                                          icon: Icon(Icons
                                              .keyboard_backspace_outlined))
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
                                              onPressed: () {
                                                if ((box.read(ArgumentConstant
                                                        .isUserLogin) ==
                                                    null)) {
                                                  Get.toNamed(
                                                      Routes.LOGIN_SCREEN);
                                                } else {
                                                  scaffoldKey.currentState!
                                                      .openEndDrawer();
                                                }
                                              },
                                              icon: Icon(
                                                Icons.shopping_cart,
                                                size: 25,
                                                color: Colors.grey[500],
                                              )),
                                          controller.count1.data == null
                                              ? Container()
                                              : Positioned(
                                                  left: 22,
                                                  top: 2,
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          32, 193, 244, 1),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Text(
                                                      "${controller.count1.data}",
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                    ),
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
                                  onTap: () {
                                    controller.dilogBox(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 10),
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
                              margin:
                                  EdgeInsets.only(top: 10, left: 13, right: 13),
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
                                border:
                                    Border.all(color: Colors.orange, width: 2),
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
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          "Pet Id",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
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
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          "Gender",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          "${controller.petData.gender.toString().toUpperCase()}",
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
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 10),
                                              child: Text(
                                                "${controller.petData.age} years old",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 10),
                                              child: Text(
                                                "${controller.petData.breed}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
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
                                  onTap: () {
                                    Get.offAndToNamed(Routes.BOOK_APPOIMENT,
                                        arguments: controller.petData.sId);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10),
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
                                          color:
                                              Color.fromRGBO(32, 193, 244, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.ADD_PET,
                                                arguments: {
                                                  ArgumentConstant.patId:
                                                      controller.petData.sId
                                                          .toString()
                                                });
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color:
                                                Color.fromRGBO(32, 193, 244, 1),
                                          ))),
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(32, 193, 244, 1),
                                          width: 2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: IconButton(
                                          onPressed: () {
                                            controller.deleteDialogBox(context);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color:
                                                Color.fromRGBO(32, 193, 244, 1),
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
                            Divider(
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            (controller.hasData1.isFalse)
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.orange),
                                  )
                                : (controller.appointmentslist.isEmpty)
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 300,
                                              width: 250,
                                              child: SvgPicture.asset(
                                                  "assets/NoData.svg"),
                                            ),
                                            Text(
                                              "No data found",
                                              style: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(
                                                      33, 43, 54, 1)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10, bottom: 10),
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Text(
                                              textAlign: TextAlign.start,
                                              "- APPOINTMENT LIST",
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: controller
                                                .appointmentslist.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    bottom: 10),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10,
                                                          top: 10,
                                                          bottom: 10),
                                                      child: Text(
                                                        "${controller.appointmentslist[index].pet!.uniqueNo}",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    32,
                                                                    193,
                                                                    244,
                                                                    1),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10, bottom: 5),
                                                      child: controller
                                                                  .appointmentslist[
                                                                      index]
                                                                  .vet!
                                                                  .name ==
                                                              null
                                                          ? Text(
                                                              "N/A",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            )
                                                          : Text(
                                                              "Dr.${controller.appointmentslist[index].vet!.name}",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10, bottom: 0),
                                                      child: controller
                                                                  .appointmentslist[
                                                                      index]
                                                                  .vet!
                                                                  .degree ==
                                                              null
                                                          ? Text(
                                                              "N/A",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            )
                                                          : Text(
                                                              "${controller.appointmentslist[index].vet!.degree}",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10, bottom: 0),
                                                      child: controller
                                                                  .appointmentslist[
                                                                      index]
                                                                  .vet!
                                                                  .experience ==
                                                              null
                                                          ? Text(
                                                              "0 years of experience",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            )
                                                          : Text(
                                                              "${controller.appointmentslist[index].vet!.experience} years of experience",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10, bottom: 3),
                                                      child: controller
                                                                  .appointmentslist[
                                                                      index]
                                                                  .vet!
                                                                  .address ==
                                                              null
                                                          ? Text(
                                                              "N/A",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey[500],
                                                                fontSize: 15,
                                                              ),
                                                            )
                                                          : Text(
                                                              "${controller.appointmentslist[index].vet!.address}",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey[500],
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10, top: 0),
                                                      child: Text(
                                                        DateFormat.yMd()
                                                            .add_jm()
                                                            .format(
                                                              DateTime.parse(
                                                                  "${controller.appointmentslist[index].date}"),
                                                            ),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: InkWell(
                                                        onTap: () {
                                                          (controller
                                                                          .appointmentslist[
                                                                              index]
                                                                          .status ==
                                                                      "canceled" ||
                                                                  controller
                                                                          .appointmentslist[
                                                                              index]
                                                                          .status ==
                                                                      "accepted" ||
                                                                  controller
                                                                          .appointmentslist[
                                                                              index]
                                                                          .status ==
                                                                      "completed" ||
                                                                  controller
                                                                          .appointmentslist[
                                                                              index]
                                                                          .status ==
                                                                      "rejected")
                                                              ? Container()
                                                              : controller.cancelAppointment(
                                                                  context:
                                                                      context,
                                                                  AppointmentId:
                                                                      "${controller.appointmentslist[index].sId}");
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  top: 5),
                                                          child: (controller.appointmentslist[index].status == "canceled" ||
                                                                  controller
                                                                          .appointmentslist[
                                                                              index]
                                                                          .status ==
                                                                      "accepted" ||
                                                                  controller
                                                                          .appointmentslist[
                                                                              index]
                                                                          .status ==
                                                                      "rejected" ||
                                                                  controller
                                                                          .appointmentslist[
                                                                              index]
                                                                          .status ==
                                                                      "completed")
                                                              ? Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5),
                                                                  child: Text(
                                                                    controller.appointmentslist[index].status ==
                                                                            "completed"
                                                                        ? "COMPLETED"
                                                                        : (controller.appointmentslist[index].status ==
                                                                                "rejected"
                                                                            ? "REJECTED"
                                                                            : (controller.appointmentslist[index].status == "accepted")
                                                                                ? "ACCEPTED"
                                                                                : "CANCELED"),
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ))
                                                              : getcon(
                                                                  color: Colors
                                                                      .orange,
                                                                  text: Text(
                                                                    "CANCEL",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  width: 100,
                                                                  height: 40,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (controller
                                                            .appointmentslist[
                                                                index]
                                                            .status !=
                                                        "accepted")
                                                      (controller
                                                                      .appointmentslist[
                                                                          index]
                                                                      .status ==
                                                                  "canceled" ||
                                                              controller
                                                                      .appointmentslist[
                                                                          index]
                                                                      .status ==
                                                                  "rejected" ||
                                                              controller
                                                                      .appointmentslist[
                                                                          index]
                                                                      .status ==
                                                                  "completed")
                                                          ? (controller
                                                                      .appointmentslist[
                                                                          index]
                                                                      .reason ==
                                                                  ""
                                                              ? Container()
                                                              : Center(
                                                                  child:
                                                                      Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5,
                                                                          left:
                                                                              15),
                                                                  child: Text(
                                                                    "Reason : ${controller.appointmentslist[index].reason}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                )))
                                                          : Center(
                                                              child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom: 5,
                                                                      top: 5),
                                                              child: Text(
                                                                  "${controller.appointmentslist[index].status} confirmation"),
                                                            )),
                                                    controller
                                                                .appointmentslist[
                                                                    index]
                                                                .isVetRated ==
                                                            true
                                                        ? Container()
                                                        : (controller
                                                                    .appointmentslist[
                                                                        index]
                                                                    .status ==
                                                                "completed"
                                                            ? Center(
                                                                child: InkWell(
                                                                onTap: () {
                                                                  controller.feedBackDialog(
                                                                      context:
                                                                          context,
                                                                      AppointmentId:
                                                                          "${controller.appointmentslist[index].sId}");
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5),
                                                                  child: Text(
                                                                    "Add Feedback",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .orange,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ))
                                                            : Container())
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      )
                          ],
                        )
                      ],
                    ),
                  ));
      }),
    ), onWillPop: () async {
      Get.offAndToNamed(Routes.MY_PET);
      return await true;
    });
  }
}
