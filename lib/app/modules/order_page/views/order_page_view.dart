import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../controllers/order_page_controller.dart';

class OrderPageView extends GetView<OrderPageController> {
  const OrderPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "My Orders",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey[300],
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text("ORDER #96000015"),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text("Placed on: 9/1/2022"),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex:3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 10,right: 40),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "https://dogs-ecom-images.s3.ap-south-1.amazonaws.com/1657359182938_51ynxsMG0PL._SX466_.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.transparent,
                                                      BlendMode.colorBurn)),
                                            ),
                                          ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                            color: Colors.grey[100],
                                          )),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "pet service",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "SURAT, KARNATAKA, INDIA",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Himalaya Fresh Coat",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Qty:",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " 1 units",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "₹230.00 / unit",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Amt:",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " ₹230.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Shipping:",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " ₹60.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Expanded(flex:1,child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Row(
                          children: [
                            Text(
                              "Current Status:",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "PENDING",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                               right: 30,top: 5),
                          child: getcon(
                              alignment: Alignment.center,
                              color: Colors.orange,
                              height: 35,
                              width: MediaQuery.of(context).size.width/2.5,
                              text: Text(
                                "Order Detail",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          )),
          Spacer(),
        ],
      ),
    );
  }
}
