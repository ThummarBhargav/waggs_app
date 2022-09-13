import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/vet_view_details_controller.dart';

class VetViewDetailsView extends GetView<VetViewDetailsController> {
  const VetViewDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        body: Container(
            color: Colors.white,
            child: (controller.hasData.isFalse)
                ? Center(
                    child: CircularProgressIndicator(),
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
                      Expanded(
                          child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 180,
                                    padding: EdgeInsets.all(100),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/catagory.jpg"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20, right: 20),
                                        width: 180,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/ca.png"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 60, left: 25),
                                            child: Text(
                                                "Dr. ${controller.vetData.name}",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange,
                                                )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 25),
                                            child: Text("Home >",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 2),
                                            child: Text(
                                                "Dr. ${controller.vetData.name}",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.grey.shade600)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                // color: Colors.cyan,
                                padding: EdgeInsets.only(
                                    top: 25, left: 15, right: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      // color: Colors.cyan,
                                      margin:
                                          EdgeInsets.only(top: 10, right: 10),
                                      height: 180,
                                      width: 180,
                                      child: getImageByLink(
                                        url: controller.vetData.logoUrl
                                            .toString(),
                                        boxFit: BoxFit.cover,
                                        height: 100,
                                        width: 150,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dr. ${controller.vetData.name}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            RatingBarIndicator(
                                              rating: controller.vetData.rating!
                                                  .toDouble(),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20.0,
                                              direction: Axis.horizontal,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              controller.vetData.rating!
                                                  .toStringAsFixed(1),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                                " | ${controller.vetData.ratedBy} Reviews",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        Colors.grey.shade500)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          indent: 2,
                                          color: Colors.grey.shade300,
                                          endIndent: 2,
                                          thickness: 1.5,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${controller.vetData.degree}",
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${controller.vetData.experience} years of professional experience",
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          indent: 2,
                                          color: Colors.grey.shade300,
                                          endIndent: 2,
                                          thickness: 1.5,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: Colors.cyan,
                                            ),
                                            Text(
                                              " (+91) ${controller.vetData.mobile}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.cyan,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.mail,
                                              color: Colors.cyan,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${controller.vetData.email}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.cyan,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Get.toNamed(Routes.DATE_TIME_APPOIMENT);
                                          },
                                          child: Container(
                                              width: 250,
                                              height: 50,
                                              padding: EdgeInsets.only(left: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  bottomRight:
                                                      Radius.circular(25),
                                                  bottomLeft: Radius.circular(25),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.date_range,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "BOOK APPOINMENT",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              )),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.vetData.fbLink;
                                                print(
                                                    "Fb===${controller.vetData.fbLink}");
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                padding: EdgeInsets.all(100),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/facebook1.png"),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // controller.vetData.;
                                                // print("insta===${controller.vetData.instaLink}");
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                padding: EdgeInsets.all(100),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/twit1.png"),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.vetData.instaLink;
                                                print(
                                                    "insta===${controller.vetData.instaLink}");
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                padding: EdgeInsets.all(100),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/insta1.png"),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.vetData.linkedinLink;
                                                print(
                                                    "linkdin===${controller.vetData.linkedinLink}");
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                padding: EdgeInsets.all(100),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/link1.png"),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.isOpen.value =
                                                !controller.isOpen.value;
                                            print(controller.isOpen.value);
                                          },
                                          child: Container(
                                            // margin: EdgeInsets.only(left: 15),
                                            padding: EdgeInsets.all(15),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(25),
                                                bottomRight:
                                                    Radius.circular(25),
                                                bottomLeft: Radius.circular(25),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Overview",
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 16),
                                                ),
                                                controller.isOpen.value == false
                                                    ? Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .keyboard_arrow_up_sharp,
                                                        color: Colors.white,
                                                      )
                                              ],
                                            ),
                                          ),
                                        ),
                                        controller.isOpen.value == false
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 5),
                                                padding: EdgeInsets.all(5),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      " - ABOUT DOCTOR",
                                                      style: GoogleFonts.actor(
                                                          fontSize: 18,
                                                          color: Colors.orange,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${controller.vetData.description}",
                                                      style: TextStyle(
                                                          // fontSize: 18,
                                                          color: Colors
                                                              .grey.shade500,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ))
                                            : Container(),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.isOpen1.value =
                                                !controller.isOpen1.value;
                                            print(controller.isOpen1.value);
                                          },
                                          child: Container(
                                            // margin: EdgeInsets.only(left: 15),
                                            padding: EdgeInsets.all(15),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(25),
                                                bottomRight:
                                                    Radius.circular(25),
                                                bottomLeft: Radius.circular(25),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Address",
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 16),
                                                ),
                                                controller.isOpen1.value ==
                                                        false
                                                    ? Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .keyboard_arrow_up_sharp,
                                                        color: Colors.white,
                                                      )
                                              ],
                                            ),
                                          ),
                                        ),
                                        controller.isOpen1.value == false
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    left: 20, right: 5, top: 5),
                                                padding: EdgeInsets.all(5),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${controller.vetData.address}",
                                                      style: GoogleFonts.lato(
                                                          color: Colors
                                                              .grey.shade600,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ))
                                            : Container(),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.isOpen2.value =
                                                !controller.isOpen2.value;
                                            print(controller.isOpen2.value);
                                          },
                                          child: Container(
                                            // margin: EdgeInsets.only(left: 15),
                                            padding: EdgeInsets.all(15),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(25),
                                                bottomRight:
                                                    Radius.circular(25),
                                                bottomLeft: Radius.circular(25),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Reviews",
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 16),
                                                ),
                                                controller.isOpen2.value ==
                                                        false
                                                    ? Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .keyboard_arrow_up_sharp,
                                                        color: Colors.white,
                                                      )
                                              ],
                                            ),
                                          ),
                                        ),
                                        controller.isOpen2.value == false
                                            ? Column(
                                                children: [
                                                  ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: controller
                                                        .vetData
                                                        .reviews!
                                                        .length,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        ((context, index) {
                                                      return Column(
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 15,
                                                                      right: 15,
                                                                      left: 15),
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 30,
                                                                      top: 20),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          25),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          25),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          25),
                                                                ),
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "${controller.vetData.reviews![index].user!.name![0]}",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade500),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "${controller.vetData.reviews![index].user!.name!.toUpperCase()}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        DateFormat("MM/dd/yyyy")
                                                                            .format(
                                                                          DateTime.parse(
                                                                              "${controller.vetData.reviews![index].updatedAt}"),
                                                                        ),
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.cyan,
                                                                            fontSize: 18),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      RatingBarIndicator(
                                                                        rating: controller
                                                                            .vetData
                                                                            .reviews![index]
                                                                            .rating!
                                                                            .toDouble(),
                                                                        itemBuilder:
                                                                            (context, index) =>
                                                                                Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Colors.amber,
                                                                        ),
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            20.0,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Text(
                                                                    "${controller.vetData.reviews![index].review}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade500,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                ],
                                                              )),
                                                        ],
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  )),
      );
    }));
  }
}
