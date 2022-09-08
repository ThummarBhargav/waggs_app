import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:waggs_app/app/Modal/OrderModel.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../constant/ConstantUrl.dart';
import '../controllers/order_page_controller.dart';

class OrderPageView extends GetView<OrderPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
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
      body: Obx(() {
        return WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(Routes.HOME);
            return true;
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: (controller.hasData.value)
                ? (controller.orderData.isEmpty)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 250,
                              child: SvgPicture.asset("assets/NoData.svg"),
                            ),
                            Text(
                              "No data found",
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color.fromRGBO(33, 43, 54, 1)),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: GroupedListView<dynamic, String>(
                              elements: controller.orderData,
                              groupBy: (element) =>
                                  element["GroupBy"].toString().split("_")[0],
                              order: GroupedListOrder.DESC,
                              useStickyGroupSeparators: false,
                              groupSeparatorBuilder: (String value) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 20),
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "ORDER #" +
                                              value.toString().split("_")[0],
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Spacer(),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Text("Placed on:"+
                                      //     DateFormat("MM/dd/yyyy").format(
                                      //         DateTime.parse(value.toString().split("_")[0])),
                                      //     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border: Border(
                                          left: BorderSide(color: Colors.grey),
                                          right: BorderSide(color: Colors.grey),
                                          top: BorderSide(color: Colors.grey))),
                                );
                              },
                              itemBuilder: (c, element) {
                                OrderDetails orderData =
                                    element["OrderData"] as OrderDetails;
                                return Container(
                                  padding: EdgeInsets.only(left: 5),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                      alignment:
                                                          Alignment.center,
                                                      margin: EdgeInsets.only(
                                                          top: 10, right: 40),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade200,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                      child: CachedNetworkImage(
                                                          imageUrl: orderData
                                                              .product!
                                                              .images![0],
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                height: 70,
                                                                width: 70,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image:
                                                                          imageProvider,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      colorFilter: ColorFilter.mode(
                                                                          Colors
                                                                              .transparent,
                                                                          BlendMode
                                                                              .colorBurn)),
                                                                ),
                                                              ),
                                                          placeholder: (context,
                                                                  url) =>
                                                              CircularProgressIndicator(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Container(
                                                                color: Colors
                                                                    .grey[100],
                                                              )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                      orderData.product!
                                                          .sellerId!.companyName
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                      "${orderData.sellerId!.city.toString()}, ${orderData.sellerId!.state.toString()}, ${orderData.sellerId!.country.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Text(
                                                    orderData.product!.title
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Qty:",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        orderData.quantity
                                                                .toString() +
                                                            " units",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Text(
                                                    "₹" +
                                                        orderData.product!.price
                                                            .toString() +
                                                        "/ unit",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Amt:",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        " ₹" +
                                                            orderData.product!
                                                                .discountedPrice
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Shipping:",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        " ₹" +
                                                            orderData
                                                                .shippingCharge
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                      Center(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 70),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Current Status:",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    orderData.status.toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(Routes.ORDER_DETAIL,
                                                    arguments: {
                                                      ArgumentConstant.orderId:
                                                          orderData.sId,
                                                    });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30,
                                                    top: 5,
                                                    bottom: 10),
                                                child: getcon(
                                                    alignment: Alignment.center,
                                                    color: Colors.orange,
                                                    height: 35,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    text: Text(
                                                      "Order Detail",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.white),
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      }),
    );
  }
}
