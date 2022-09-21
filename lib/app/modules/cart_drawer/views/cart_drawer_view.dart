import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';

import '../../../constant/Container.dart';
import '../../../constant/SizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/cart_drawer_controller.dart';

class CartDrawerView extends GetWidget<CartDrawerController> {
  const CartDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartDrawerController>(
      assignId: true,
      init: CartDrawerController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(() {
            return Column(
              children: [
                Container(
                  height: 70,
                  child: DrawerHeader(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(32, 193, 244, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            margin: EdgeInsets.only(right: 10),
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "SHOPPING BAG " +
                                  "(${(controller.count1.data != null) ? controller.count1.data : "0"})",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                    flex: 9,
                    child: (controller.hasData.isFalse)
                        ? Center(child: CircularProgressIndicator())
                        : (isNullEmptyOrFalse(controller.cartProductList))
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 300,
                                      width: 250,
                                      child:
                                          SvgPicture.asset("assets/NoData.svg"),
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
                            : ListView.builder(
                                itemCount: controller.cartProductList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: double.infinity,
                                    height: 180,
                                    color: Colors.grey.shade200,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                CachedNetworkImage(
                                                    imageUrl:
                                                        "${controller.cartProductList[index].product!.images![0]}",
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          height: 80,
                                                          width: 80,
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
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Container(
                                                          color:
                                                              Colors.grey[100],
                                                        )),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, top: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${controller.cartProductList[index].product!.title}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    controller
                                                                .cartProductList[
                                                                    index]
                                                                .product!
                                                                .sellerId!
                                                                .waiveOffShipping ==
                                                            false
                                                        ? Container()
                                                        : Text(
                                                            "Not delivering in your area",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 10),
                                                          ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      controller.CartDeleteApi(
                                                        data: controller
                                                                .cartProductList[
                                                            index],
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.delete_rounded,
                                                      color: Color.fromRGBO(
                                                          32, 193, 244, 1),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          indent: 2,
                                          color: Colors.grey.shade500,
                                          endIndent: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                height: 34,
                                                margin:
                                                    EdgeInsets.only(left: 8),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                padding: EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                  ),
                                                  border: Border.all(
                                                    color: Colors.grey.shade400,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                          onTap: () {
                                                            (controller
                                                                        .cartProductList[
                                                                            index]
                                                                        .quantity ==
                                                                    1)
                                                                ? controller.CartDeleteApi(
                                                                    data: controller
                                                                            .cartProductList[
                                                                        index])
                                                                : controller
                                                                    .UpdateCartRemove(
                                                                    data: controller
                                                                            .cartProductList[
                                                                        index],
                                                                  );
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8.0,
                                                                    right: 5),
                                                            child: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.black,
                                                              size: 22,
                                                            ),
                                                          )),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      height: 75,
                                                      width: 75,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300,
                                                        border: Border(
                                                          left: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1.0,
                                                          ),
                                                          right: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        "${controller.cartProductList[index].quantity}",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                    )),
                                                    Expanded(
                                                      child: InkWell(
                                                          onTap: () {
                                                            controller
                                                                .UpdateCartAdd(
                                                              data: controller
                                                                      .cartProductList[
                                                                  index],
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.black,
                                                            size: 22,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "\u{20B9}${controller.cartProductList[index].product!.discountedPrice! * controller.cartProductList[index].quantity!}.00",
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                (controller
                                                            .cartProductList[
                                                                index]
                                                            .product!
                                                            .sellerId!
                                                            .shippingCharge
                                                            .floor() ==
                                                        0)
                                                    ? Container()
                                                    : Text(
                                                        "+ \u{20B9}${controller.cartProductList[index].product!.sellerId!.shippingCharge.toStringAsFixed(0)}.00" +
                                                            " Shipping",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )),
                controller.cartProductList.isEmpty
                    ? Container()
                    : Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            var sum = 0;
                            controller.cartProductList.forEach((element) {
                              sum += element.product!.discountedPrice! *
                                  element.quantity!;
                            });
                            return Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "SUBTOTAL",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey.shade600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "\u{20B9}${sum}.00",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.VIEW_CART);
                                      // Get.toNamed(Routes.TAB_BAR1);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 8, right: 8),
                                      child: getcon(
                                          alignment: Alignment.center,
                                          color:
                                              Color.fromRGBO(32, 193, 244, 1),
                                          height: 30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          text: Text(
                                            "VIEW CART",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ))
              ],
            );
          }),
        );
      },
    );
  }
}
