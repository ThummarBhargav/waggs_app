import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constant/Container.dart';
import '../controllers/order_detail_controller.dart';

class OrderDetailView extends GetWidget<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   title: Text(""),
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: Colors.black,
      //       )),
      // ),
      body: Obx(() {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 15,
              right: 15,
              bottom: 20),
          child: (controller.hasData.value)
              ? (controller.orderDetailModel != null)
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      )),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Order #${controller.orderDetailModel!.data!.orderId?.orderNo!}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Placed on ${DateFormat('MM/dd/yyyy').format(getDateFromString(controller.orderDetailModel!.data!.orderId?.createdAt ?? ""))}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                (controller.orderDetailModel!.data!.status ==
                                        "COMPLETED")
                                    ? Container()
                                    : Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 0, top: 5, bottom: 10),
                                          child: InkWell(
                                            onTap: () {
                                              showAlertDialog(context);
                                            },
                                            child: getcon(
                                                alignment: Alignment.center,
                                                color: Colors.orange,
                                                height: 48,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                text: Text(
                                                  (controller.orderDetailModel!
                                                                  .data!.status ==
                                                              "CANCELED" ||
                                                          controller
                                                                  .orderDetailModel!
                                                                  .data!
                                                                  .status !=
                                                              "PENDING")
                                                      ? "Raise Dispute"
                                                      : "Cancel Order",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getStatusWidget(
                                        orderStatus: "PENDING",
                                        status: controller
                                            .orderDetailModel!.data!.status!,
                                        isDone: controller.listOfPassedStatus!
                                            .contains("PENDING"),
                                        no: 1),
                                    getStatusWidget(
                                        orderStatus: "ACCEPTED",
                                        status: controller
                                            .orderDetailModel!.data!.status!,
                                        isDone: controller.listOfPassedStatus!
                                            .contains("ACCEPTED"),
                                        no: 2),
                                    getStatusWidget(
                                        orderStatus: "PROCESSING",
                                        status: controller
                                            .orderDetailModel!.data!.status!,
                                        isDone: controller.listOfPassedStatus!
                                            .contains("PROCESSING"),
                                        no: 3),
                                    getStatusWidget(
                                        orderStatus: "DISPATCHED",
                                        status: controller
                                            .orderDetailModel!.data!.status!,
                                        isDone: controller.listOfPassedStatus!
                                            .contains("DISPATCHED"),
                                        no: 4),
                                    getStatusWidget(
                                        orderStatus: "DELIVERED",
                                        status: controller
                                            .orderDetailModel!.data!.status!,
                                        isDone: controller.listOfPassedStatus!
                                            .contains("DELIVERED"),
                                        no: 5),
                                    getStatusWidget(
                                        orderStatus: "COMPLETED",
                                        status: controller
                                            .orderDetailModel!.data!.status!,
                                        isDone: controller.listOfPassedStatus!
                                            .contains("COMPLETED"),
                                        no: 6),
                                    if (controller
                                            .orderDetailModel!.data!.status ==
                                        "CANCELED") ...[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Status: ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            controller
                                                .orderDetailModel!.data!.status
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                              imageUrl: controller
                                                  .orderDetailModel!
                                                  .data!
                                                  .product!
                                                  .images![0],
                                              imageBuilder: (context,
                                                      imageProvider) =>
                                                  Container(
                                                    // margin: EdgeInsets.all(10),
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                                  Colors
                                                                      .transparent,
                                                                  BlendMode
                                                                      .colorBurn)),
                                                    ),
                                                  ),
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                        color: Colors.grey[100],
                                                      )),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${controller.orderDetailModel!.data!.product!.title}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Qty:",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                controller.orderDetailModel!
                                                        .data!.quantity
                                                        .toString() +
                                                    " units",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            " ₹" +
                                                controller
                                                    .orderDetailModel!
                                                    .data!
                                                    .product!
                                                    .discountedPrice!
                                                    .toStringAsFixed(2) +
                                                " / unit",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Amt:",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                " ₹" +
                                                    (controller
                                                                .orderDetailModel!
                                                                .data!
                                                                .quantity! *
                                                            controller
                                                                .orderDetailModel!
                                                                .data!
                                                                .product!
                                                                .discountedPrice!)
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Shipping:",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                " ₹" +
                                                    controller.orderDetailModel!
                                                        .data!.shippingCharge!
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            controller.orderDetailModel!.data!
                                                .product!.sellerId!.companyName
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${controller.orderDetailModel!.data!.sellerId!.city.toString()}, ${controller.orderDetailModel!.data!.sellerId!.state.toString()}, ${controller.orderDetailModel!.data!.sellerId!.country.toString()}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Delivery address",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${controller.orderDetailModel!.data!.userId!.address}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Delivery address",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${controller.orderDetailModel!.data!.userId!.address}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(
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
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      }),
    );
  }

  getStatusWidget(
      {String status = "PENDING",
      orderStatus = "PENDING",
      int no = 1,
      bool isDone = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor:
                  (controller.orderDetailModel!.data!.status.toString() ==
                          orderStatus)
                      ? Color(0xff20C1F4)
                      : (isDone)
                          ? Color(0xff20C1F4)
                          : Colors.grey,
              child: Center(
                child: (isDone)
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : Text(
                        no.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            if (orderStatus != "COMPLETED") ...[
              SizedBox(
                height: 5,
              ),
              Container(
                // margin: EdgeInsets.only(left: 10),
                width: 2,
                height: 25,
                color: Colors.grey,
              ),
              SizedBox(
                height: 5,
              ),
            ]
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            orderStatus,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = InkWell(
      child: Text(
        "No  ",
        style: TextStyle(
          color: Color(0xff20C1F4),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Get.back();
      },
    );
    Widget continueButton = InkWell(
      child: Text(
        "Yes     ",
        style: TextStyle(
          color: Color(0xff20C1F4),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        if ((controller.orderDetailModel!.data!.status == "CANCELED")) {
          Get.back();

          controller.disputeOrder("DISPUTED");
        } else {
          Get.back();

          controller.cancelOrder();
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text("AlertDialog"),
      content: Text(
        ((controller.orderDetailModel!.data!.status == "CANCELED"))
            ? "Are you sure you want to raise dispute?"
            : "Are you sure you want to cancel order?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      actions: [
        continueButton,
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

DateTime getDateFromString(String dateString, {String? formatter}) {
  const String kMainSourceFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
  if (formatter == null) {
    formatter = kMainSourceFormat;
  }
  return DateFormat(formatter).parse(dateString);
}
