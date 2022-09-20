import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/modules/cart_drawer/views/cart_drawer_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../controllers/plane_controller.dart';

class PlaneView extends GetWidget<PlaneController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  PlaneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (controller.isDataAccepted.isFalse) {
      if (Get.arguments != null) {
        controller.isFromDrawer.value =
            Get.arguments[ArgumentConstant.isFromDrawer];
      } else {
        controller.isFromDrawer.value = false;
      }
      controller.AllPlans();
      controller.isDataAccepted.value = true;
    }
    return GetBuilder<PlaneController>(
        init: PlaneController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              (controller.isFromDrawer.isFalse)
                  ? Get.offAndToNamed(Routes.MY_PET)
                  : Get.back();
              controller.isDataAccepted.value = false;
              return await true;
            },
            child: SafeArea(child: Obx(() {
              return Scaffold(
                endDrawer: Drawer(
                  child: CartDrawerView(),
                ),
                key: scaffoldKey,
                body: Column(
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
                                        controller.isDataAccepted.value = false;
                                        (controller.isFromDrawer.isFalse)
                                            ? Get.offAndToNamed(Routes.MY_PET)
                                            : Get.back();
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
                                  // IconButton(
                                  //     onPressed: () {
                                  //       if ((box.read(
                                  //               ArgumentConstant.isUserLogin) ==
                                  //           null)) {
                                  //         Get.toNamed(Routes.LOGIN_SCREEN);
                                  //       } else {
                                  //         scaffoldKey.currentState!
                                  //             .openEndDrawer();
                                  //       }
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.search,
                                  //       size: 25,
                                  //       color: Colors.grey,
                                  //     )),
                                  Stack(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if ((box.read(ArgumentConstant
                                                    .isUserLogin) ==
                                                null)) {
                                              Get.toNamed(Routes.LOGIN_SCREEN);
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
                                      (controller.count1.data == 0 ||
                                              controller.count1.data == null)
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
                                                  style: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
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
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 180,
                                padding: EdgeInsets.all(100),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/catagory.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 20),
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
                                        margin:
                                            EdgeInsets.only(top: 60, left: 25),
                                        child: Text("Plans",
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
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(top: 5, left: 25),
                                          child: Text("Home >",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 2),
                                        child: Text("Subscription Package",
                                            style: GoogleFonts.roboto(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade600)),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            "SUBSCRIPTION  PLANS",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                                color: Colors.orange,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: Text(
                              "Welcome to Waggs.in, your trustable ally in your search for quality food, supplements and toys for your pets. Created by loving pet parents themselves, "
                              "Waggs.in is born out of sheer passion, love and care for those better halves of our lives.",
                              style: GoogleFonts.actor(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 250.0,
                            width: 230.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/plan1.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18),
                                child: Text(
                                  "TREAT YOUR DOG TO ROYALTY",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "Benefits of joining Alpha Club",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "Assure your dog of proactive health care",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.orange,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 12),
                                child: Text(
                                  "Book experienced top quality vets to visit your home to check on your dog’s well-being",
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "Secure Salon spots on busy days",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.orange,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 12),
                                child: Text(
                                  "Get Salon appointments secured from the top Salon partners we have ready for you",
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "Free shipping on all orders",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.orange,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 12),
                                child: Text(
                                  "No matter how small the order is or how far you live, save on free shipping",
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 250.0,
                            width: 230.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/plan2.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 18),
                                child: Text(
                                  "WHY BECOME PART OF ALPHA CLUB",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange,
                                      fontSize: 19),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "A few reasons why so many of our valued customers choose Alpha Club",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "Subscription saves time",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.orange,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 12),
                                child: Text(
                                  "Our customers are busy working professionals but they don’t want to be too busy for their furry friends. "
                                  "Subscription plan offers the peace of mind. Pay once and let us deal with the rest.",
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "Convenience of vet appointments",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.orange,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 12),
                                child: Text(
                                  "Our customers want to be proactive about their dog's health. "
                                  "They like vets visiting them at regular intervals to check on their dog's health and not wait till something happens",
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 20),
                                child: Text(
                                  "Secure Salon spots on busy days",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.orange,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 12),
                                child: Text(
                                  "Our customers don’t want to wait in long queues at the salons on busy days like public holidays and weekends.",
                                  style: GoogleFonts.actor(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "SUBSCRIPTION  PLANS",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w700,
                                color: Colors.orange,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          controller.planList.isEmpty
                              ? CircularProgressIndicator()
                              : Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 400,
                                        width: 400,
                                        child: GridView.builder(
                                            itemCount:
                                                controller.planList.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              print(
                                                  '${controller.planList[index]}');
                                              return Container(
                                                margin: EdgeInsets.all(10),
                                                color: Colors.grey.shade200,
                                                child: Column(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: controller
                                                                        .planList[
                                                                            index]
                                                                        .id ==
                                                                    'basic'
                                                                ? Colors
                                                                    .lightBlue
                                                                    .shade100
                                                                : controller
                                                                            .planList[
                                                                                index]
                                                                            .id ==
                                                                        'standard'
                                                                    ? Colors
                                                                        .orange
                                                                        .shade400
                                                                    : Colors
                                                                        .lightBlue
                                                                        .shade500,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          250),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      250),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          child: Center(
                                                              child: Text(
                                                            "${controller.planList[index].name}",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )),
                                                        ),
                                                        Container(
                                                          width: 80,
                                                          height: 80,
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 80,
                                                                  top: 60),
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white,
                                                                  image: controller
                                                                              .planList[
                                                                                  index]
                                                                              .id ==
                                                                          'basic'
                                                                      ? DecorationImage(
                                                                          image:
                                                                              AssetImage("assets/p1.JPG"),
                                                                        )
                                                                      : controller.planList[index].id ==
                                                                              'standard'
                                                                          ? DecorationImage(
                                                                              image: AssetImage("assets/p2.JPG"))
                                                                          : DecorationImage(image: AssetImage("assets/p3.png"))),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                        child: controller
                                                                    .planList[
                                                                        index]
                                                                    .id ==
                                                                'basic'
                                                            ? Text(
                                                                "2 Vet Visits",
                                                                style: GoogleFonts.raleway(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black54),
                                                              )
                                                            : controller
                                                                        .planList[
                                                                            index]
                                                                        .id ==
                                                                    'standard'
                                                                ? Text(
                                                                    "4 Vet Visits",
                                                                    style: GoogleFonts.raleway(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .black54),
                                                                  )
                                                                : Text(
                                                                    "9 Vet Visits",
                                                                    style: GoogleFonts.raleway(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .black54),
                                                                  )),
                                                    Container(
                                                      height: 15,
                                                      child: Divider(
                                                        indent: 20,
                                                        color: Colors.black54,
                                                        endIndent: 20,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                        child: controller
                                                                    .planList[
                                                                        index]
                                                                    .id ==
                                                                'basic'
                                                            ? Text(
                                                                "2 Salon Visits",
                                                                style: GoogleFonts.raleway(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .black54),
                                                              )
                                                            : controller
                                                                        .planList[
                                                                            index]
                                                                        .id ==
                                                                    'standard'
                                                                ? Text(
                                                                    "4 Salon Visits",
                                                                    style: GoogleFonts.raleway(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .black54),
                                                                  )
                                                                : Text(
                                                                    "9 Salon Visits",
                                                                    style: GoogleFonts.raleway(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .black54),
                                                                  )),
                                                    Container(
                                                      height: 15,
                                                      child: Divider(
                                                        indent: 20,
                                                        color: Colors.black54,
                                                        endIndent: 20,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "\u{20B9}${controller.planList[index].amount}.00",
                                                        style:
                                                            GoogleFonts.raleway(
                                                          color: Colors.orange,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "FOR ${controller.planList[index].validity} MONTHS",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller.PayMent(
                                                            data: controller
                                                                    .planList[
                                                                index]);
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 150,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .orange.shade400,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    25),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    25),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    25),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "PAY NOW",
                                                          style: GoogleFonts
                                                              .raleway(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 1,
                                                    childAspectRatio: 1.54)),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    )),
                  ],
                ),
              );
            })),
          );
        });
  }
}

//  Container(
//                         height: 450,
//                         margin: EdgeInsets.all(35),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(5))
//                         ),
//                         child: Column(
//                           children: [
//                               Stack(
//                                 children: [
//                               Container(
//                                 height: 140,
//                                 decoration: BoxDecoration(
//                                     color: Colors.lightBlue.shade200,
//                                     borderRadius: BorderRadius.only(
//                                     bottomRight: Radius.circular(250),
//                                     bottomLeft: Radius.circular(250),
//                                   ),
//                                 ),
//                               ),
//                                 Container(
//                                     width: 90,
//                                     height: 90,
//                                     alignment: Alignment.center,
//                                     margin: EdgeInsets.only(left: 120,top: 100),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                       image: DecorationImage(
//                                           image: AssetImage("assets/p1.JPG"),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             SizedBox(height: 10,),
//                             Container(
//                               child: Text("2 Vet Visits",
//                                 style: GoogleFonts.raleway(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black54
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 15,
//                               child: Divider(
//                                 indent: 20,
//                                 color: Colors.black54,
//                                 endIndent: 20,
//                                 height: 1,
//                               ),
//                             ),
//                             SizedBox(height: 10,),
//                             Container(
//                               child: Text("2 Salon Visits",
//                                 style: GoogleFonts.raleway(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black54
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               height: 15,
//                               child: Divider(
//                                 indent: 20,
//                                 color: Colors.black54,
//                                 endIndent: 20,
//                                 height: 1,
//                               ),
//                             ),
//                             SizedBox(height: 10,),
//                             Container(
//                               child: Text("₹9500.00",
//                                 style: GoogleFonts.raleway(
//                                   color: Colors.orange,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 20,),
//                             Container(
//                               child: Text("FOR 3 MONTHS",
//                                 style: GoogleFonts.raleway(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   fontSize: 16
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 30,),
//                             InkWell(
//                               onTap: () {
//
//                               },
//                               child: Container(
//                                 height: 50,
//                                 width: 150,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color: Colors.orange.shade400,
//                                   borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(25),
//                                     bottomLeft: Radius.circular(25),
//                                     bottomRight: Radius.circular(25),
//                                   ),
//                                 ),
//                                 child: Text("PAY NOW",
//                                   style: GoogleFonts.raleway(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
