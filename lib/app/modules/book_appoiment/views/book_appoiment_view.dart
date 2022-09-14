import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/book_appoiment_controller.dart';

class BookAppoimentView extends GetView<BookAppoimentController> {
  const BookAppoimentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(Routes.PET_VIEW_DETAILS, arguments: controller.petid);
        return await true;
      },
      child: SafeArea(child: Obx(() {
        return Scaffold(
            body: (controller.hasData.isFalse)
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
                                          Get.offAndToNamed(
                                              Routes.PET_VIEW_DETAILS,
                                              arguments: controller.petid);
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
                                            onPressed: () {
                                              // if ((box.read(
                                              //     ArgumentConstant.isUserLogin) ==
                                              //     null)) {
                                              //   Get.toNamed(Routes.LOGIN_SCREEN);
                                              //   scaffoldKey.currentState!
                                              //       .closeEndDrawer();
                                              // }
                                              // else {
                                              //   controller.CartProductApi();
                                              //   controller.CartCount();
                                              //   scaffoldKey.currentState!
                                              //       .openEndDrawer();
                                              // }
                                            },
                                            icon: Icon(
                                              Icons.shopping_cart,
                                              size: 25,
                                              color: Colors.grey[500],
                                            )),
                                        // controller.count1.data == null
                                        //     ? Container()
                                        //     : Positioned(
                                        //     left: 22,
                                        //     top: 2,
                                        //     child: Container(
                                        //       width: 18,
                                        //       height: 18,
                                        //       alignment: Alignment.center,
                                        //       decoration: BoxDecoration(
                                        //         color: Color.fromRGBO(
                                        //             32, 193, 244, 1),
                                        //         shape: BoxShape.circle,
                                        //       ),
                                        //       child: Text(
                                        //         "${controller.count1.data}",
                                        //         style: GoogleFonts.raleway(
                                        //             fontWeight: FontWeight.bold,
                                        //             color: Colors.white),
                                        //       ),
                                        //     )),
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
                          child: SmartRefresher(
                        controller: controller.refreshController,
                        enablePullDown: false,
                        enablePullUp: false,
                        onLoading: () {
                          controller.getAllVet(
                              context: context, isFromLoading: true);
                        },
                        child: SingleChildScrollView(
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
                                            child: Text("Selected Vet",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 25,
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
                                            child: Text("My Pets >",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.grey.shade600)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 2),
                                            child: Text("Selected Vets",
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
                              Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Container(
                                      // height: 480,
                                      // width: 400,
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: controller.vetList.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 1,
                                                  childAspectRatio: 0.8,
                                                  mainAxisSpacing: 15),
                                          itemBuilder: (context, index) {
                                            return Card(
                                              margin: EdgeInsets.only(
                                                  right: 10, left: 10),
                                              child: Container(
                                                // color: Colors.green,
                                                child: Column(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          color: Colors
                                                              .grey.shade200,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  right: 10,
                                                                  left: 10),
                                                          height: 430,
                                                          width: 400,
                                                          child: getImageByLink(
                                                            url: controller
                                                                .vetList[index]
                                                                .logoUrl
                                                                .toString(),
                                                            boxFit:
                                                                BoxFit.cover,
                                                            height: 150,
                                                            width: 150,
                                                          ),
                                                        ),
                                                        Container(
                                                            color: Colors.white,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 10,
                                                                    left: 10),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    right: 20,
                                                                    bottom: 10,
                                                                    top: 220),
                                                            height: 200,
                                                            width: 300,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'DR.${controller.vetList[index].name}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          16.0),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  '${controller.vetList[index].degree}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          15.0),
                                                                ),
                                                                RatingBarIndicator(
                                                                  rating: controller
                                                                      .vetList[
                                                                          index]
                                                                      .rating!
                                                                      .toDouble(),
                                                                  itemBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),
                                                                  itemCount: 5,
                                                                  itemSize:
                                                                      18.0,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                ),
                                                                SizedBox(
                                                                  height: 2,
                                                                ),
                                                                Text(
                                                                  '${controller.vetList[index].experience} years of professional experience',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      fontSize:
                                                                          15.0),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  '${controller.vetList[index].address}',
                                                                  style: GoogleFonts.abel(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          15.0),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.toNamed(
                                                                              Routes.VET_VIEW_DETAILS,
                                                                              arguments: [
                                                                                "${controller.petid}",
                                                                                "${controller.vetList[index].sId}"
                                                                              ]);
                                                                        },
                                                                        child: getcon(
                                                                            color: Colors.orange,
                                                                            width: 120,
                                                                            height: 40,
                                                                            alignment: Alignment.center,
                                                                            text: Text(
                                                                              "VIEW DETAILS",
                                                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                                                                            )),
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.offAndToNamed(
                                                                            Routes.DATE_TIME_APPOIMENT,
                                                                            arguments: [
                                                                              "${controller.petid}",
                                                                              "${controller.vetList[index].sId}"
                                                                            ],
                                                                          );
                                                                        },
                                                                        child: getcon(
                                                                            color: Colors
                                                                                .cyan,
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                40,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            text: Text("SELECT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
                                                                      )
                                                                    ])
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                    ],
                  ));
      })),
    );
  }
}
