import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/modules/product_detail_view/views/product_detail_view_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../controllers/top_selling_store_all_products_controller.dart';

class TopSellingStoreAllProductsView
    extends GetView<TopSellingStoreAllProductsController> {

  var ScaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        controller.Countlist.refresh();
        return Scaffold(
          key: ScaffoldKey2,
          endDrawer: Drawer(
            width: 280,
            child:(controller.isFilterDrawer.isFalse)?Column(
              children: [
                Expanded(
                  flex: 1,
                  child: DrawerHeader(
                      decoration:
                      BoxDecoration(color: Color.fromRGBO(32, 193, 244, 1)),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
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
                                  "(${controller.count1.data})",
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
                        :ListView.builder(
                      itemCount:
                      controller.cartProductList.length,
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
                                                margin: EdgeInsets
                                                    .all(10),
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
                                          errorWidget: (context,
                                              url, error) =>
                                              Expanded(
                                                  child:
                                                  Container(
                                                    color: Colors
                                                        .grey[100],
                                                  ))),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(
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
                                                FontWeight
                                                    .w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller
                                                .CartDeleteApi(
                                              data: controller
                                                  .cartProductList[
                                              index],
                                            );
                                          },
                                          icon: Icon(
                                            Icons.delete_rounded,
                                            color: Color.fromRGBO(32, 193, 244, 1),
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
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 34,
                                      margin: EdgeInsets.only(
                                          left: 8),
                                      width:
                                      MediaQuery.of(context)
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
                                          color: Colors
                                              .grey.shade400,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                                onTap: () {
                                                  (controller.cartProductList[index].quantity ==
                                                      1)
                                                      ? controller.CartDeleteApi(
                                                      data: controller.cartProductList[
                                                      index])
                                                      : controller
                                                      .UpdateCartRemove(
                                                    data: controller
                                                        .cartProductList[index],
                                                  );
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left:
                                                      8.0,
                                                      right:
                                                      5),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors
                                                        .black,
                                                    size: 22,
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                              child: Container(
                                                height: 75,
                                                width: 75,
                                                padding: EdgeInsets
                                                    .symmetric(
                                                    horizontal: 3,
                                                    vertical: 2),
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors
                                                      .grey.shade300,
                                                  border: Border(
                                                    left: BorderSide(
                                                      color:
                                                      Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    right: BorderSide(
                                                      color:
                                                      Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                      "${controller.cartProductList[index].quantity}",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey
                                                              .shade500,
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
                                                  color: Colors
                                                      .black,
                                                  size: 22,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Text(
                                      "\u{20B9}${controller.cartProductList[index].product!.discountedPrice! * controller.cartProductList[index].quantity!}.00",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight:
                                          FontWeight.w800),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    )),
                controller.cartProductList == null
                    ? Container()
                    : Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount:1,
                      itemBuilder: (context, index) {
                        var sum =0;
                        controller.cartProductList.forEach((element) {
                          sum+= element.product!.discountedPrice! * element.quantity!;
                        });
                        return Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    "SUBTOTAL",
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight.w700,
                                        color: Colors
                                            .grey.shade600),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(
                                        8.0),
                                    child: Text(
                                      "\u{20B9}${sum}.00",
                                      style: TextStyle(
                                          color:
                                          Colors.orange,
                                          fontWeight:
                                          FontWeight
                                              .w800),
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(Routes.VIEW_ALL_MY_CART);
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      top: 15.0,
                                      left: 8,
                                      right: 8),
                                  child: getcon(
                                      alignment:
                                      Alignment.center,
                                      color: Color.fromRGBO(32, 193, 244, 1),
                                      height: 30,
                                      width:
                                      MediaQuery.of(context)
                                          .size
                                          .width,
                                      text: Text(
                                        "VIEW CART",
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w800,
                                            color:
                                            Colors.white),
                                      )),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ))
              ],
            ):
            Column(
              children: [
                Container(
                  height: 80,
                  child: DrawerHeader(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text("Filters",
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              child: Text("Clear All",
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(32, 193, 244, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Price",
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SfRangeSlider(
                          min: 100,
                          max: 30000,
                          activeColor: Color.fromRGBO(32, 193, 244, 1),
                          showTicks: true,
                          numberFormat: NumberFormat("\$"),
                          onChanged: (value) {
                            controller.values = value;
                          },
                          values: controller.values,
                        ),
                        ListTile(
                          title: Text("Discount",
                            style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SfRangeSlider(
                          min: 0,
                          max: 100,
                          activeColor: Color.fromRGBO(32, 193, 244, 1),
                          showTicks: true,
                          numberFormat: NumberFormat("\$"),
                          onChanged: (value) {
                            controller.values1 = value;
                          },
                          values: controller.values1,
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            controller.isOp.value = !controller.isOp.value;
                            print(controller.isOp.value);
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text("Category",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Obx(() =>
                                    controller.isOp.value == false ? Icon(
                                      Icons.keyboard_arrow_down_outlined,) :
                                    Icon(Icons.keyboard_arrow_up_sharp,),)
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(() =>
                        controller.isOp.value == false ?
                        Container() : Container(
                          margin: EdgeInsets.only(left: 22),
                          padding: EdgeInsets.all(5),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 210,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.CatagoryList.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Container(
                                          child: Obx(() {
                                            return Radio(
                                              activeColor: Color.fromRGBO(32,
                                                  193, 244, 1),
                                              onChanged: (value) {
                                                controller.radioGValues.value =
                                                value as String;
                                                controller.radioGValues.value != null ? controller.isOp2
                                                    .value == true : false;
                                                controller.isOp2.value = true;
                                                controller
                                                    .SubCatagoryList[index].sId;
                                                print("SID : ${controller
                                                    .SubCatagoryList[index]
                                                    .sId}");
                                                controller.sidValues.value =
                                                controller.CatagoryList[index]
                                                    .sId!;
                                                print("${controller.sidValues
                                                    .value}");
                                                controller.subData.clear();
                                                controller.SubCatagoryList
                                                    .forEach(
                                                        (element) {
                                                      if (element.categoryId ==
                                                          controller
                                                              .CatagoryList[index]
                                                              .sId) {
                                                        controller.subData.add(
                                                            element);
                                                        print("Data" +
                                                            element.name
                                                                .toString());
                                                      } else {}
                                                    });
                                              },
                                              value: controller
                                                  .CatagoryList[index].name,
                                              groupValue: controller
                                                  .radioGValues.value,);
                                          }),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${controller.CatagoryList[index]
                                                .name}",
                                            style: GoogleFonts.raleway(
                                                fontSize: 14,
                                                color: Colors.black
                                            ),),
                                        ),
                                      ],
                                    );
                                  },),
                              ),
                            ],
                          ),
                        )
                        ),
                        Obx(() =>
                        controller.isOp2.value == false ? Container() : InkWell(
                          onTap: () {
                            controller.isOp1.value = !controller.isOp1.value;
                            print(controller.isOp1.value);
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text("SubCategory",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Obx(() =>
                                    controller.isOp1.value == false ? Icon(
                                      Icons.keyboard_arrow_down_outlined,) :
                                    Icon(Icons.keyboard_arrow_up_sharp,),)
                                ),
                              ],
                            ),
                          ),
                        ),),
                        Obx(() =>
                        controller.isOp1.value == false ? Container() :
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              padding: EdgeInsets.all(5),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 230,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.subData.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Container(
                                              child: Obx(() {
                                                return Radio(
                                                  activeColor: Color.fromRGBO(
                                                      32, 193, 244, 1),
                                                  onChanged: (value) {
                                                    controller.radioGValues1
                                                        .value =
                                                    value as String;
                                                    controller.radioGValues1
                                                        .value != ""
                                                        ? controller.isOp3
                                                        .value == true
                                                        : false;
                                                    controller.isOp3.value =
                                                    true;
                                                    controller
                                                        .SubCatagoryList[index]
                                                        .sId;
                                                    controller.subDataIndex
                                                        .value = index;
                                                    controller.productList
                                                        .clear();
                                                  },
                                                  value: controller
                                                      .subData[index].name,
                                                  groupValue: controller
                                                      .radioGValues1.value,);
                                              }),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${controller.subData[index]
                                                    .name}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 14,
                                                    color: Colors.black
                                                ),),
                                            ),
                                          ],
                                        );
                                      },),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        ),
                        Container(
                          height: 350,
                          margin: EdgeInsets.only(left: 15,top: 5),
                          padding: EdgeInsets.only(top: 15,right: 10),
                          child:ListView.builder(
                            itemCount: controller.subData[controller
                                .subDataIndex.value].fields!
                                .length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                     InkWell(
                                      onTap:(){
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15,top: 15),
                                        child:Text("${controller.subData[controller
                                            .subDataIndex.value].fields![index].id.toString()}",style: TextStyle(fontSize: 18),),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Icon(Icons.keyboard_arrow_up_outlined),
                                    )
                                  ]
                                );
                              },)
                        ),

                        Obx(() =>
                        controller.isOp3.value == false ? Container() : InkWell(
                          onTap: () {
                            controller.isOp4.value = !controller.isOp4.value;
                            print(controller.isOp4.value);
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text("Brand",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Obx(() =>
                                    controller.isOp4.value == false ? Icon(
                                      Icons.keyboard_arrow_down_outlined,) :
                                    Icon(Icons.keyboard_arrow_up_sharp,),)
                                ),
                              ],
                            ),
                          ),
                        ),),
                        Obx(() =>
                        controller.isOp4.value == false ? Container() :
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              padding: EdgeInsets.all(5),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 230,
                                    child: ListView.builder(
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.subData[controller
                                          .subDataIndex.value].fields![0]
                                          .values!.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Container(
                                              child: Obx(() {
                                                return Checkbox(
                                                  onChanged: (value) {
                                                    controller.checkBox.value = value as bool;
                                                  },
                                                value: controller.checkBox.value);
                                              }),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: Text(
                                                controller.subData[controller
                                                    .subDataIndex.value]
                                                    .fields![0].values![index]
                                                    .toString(),
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black
                                                ),),
                                            )
                                          ],
                                        );
                                      },),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        ),
                        Obx(() =>
                        controller.isOp3.value == false ? Container() : InkWell(
                          onTap: () {
                            controller.isOp5.value = !controller.isOp5.value;
                            print(controller.isOp5.value);
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text("Veg / Non veg",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Obx(() =>
                                    controller.isOp5.value == false ? Icon(
                                      Icons.keyboard_arrow_down_outlined,) :
                                    Icon(Icons.keyboard_arrow_up_sharp,),)
                                ),
                              ],
                            ),
                          ),
                        ),),
                        Obx(() =>
                        controller.isOp5.value == false ? Container() :
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              padding: EdgeInsets.all(5),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 230,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.SubCatagoryList
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Container(
                                              child: Obx(() {
                                                return Radio(
                                                  activeColor: Color.fromRGBO(
                                                      32, 193, 244, 1),
                                                  onChanged: (value) {
                                                    controller.radioGValues2
                                                        .value =
                                                    value as String;
                                                  },
                                                  value: controller
                                                      .SubCatagoryList[index]
                                                      .name,
                                                  groupValue: controller
                                                      .radioGValues2.value,);
                                              }),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: Text(
                                                "Veg / Non veg",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black
                                                ),),
                                            )
                                          ],
                                        );
                                      },),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        ),
                        Obx(() =>
                        controller.isOp3.value == false ? Container() : InkWell(
                          onTap: () {
                            controller.isOp6.value = !controller.isOp6.value;
                            print(controller.isOp6.value);
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text("Color",
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Obx(() =>
                                    controller.isOp6.value == false ? Icon(
                                      Icons.keyboard_arrow_down_outlined,) :
                                    Icon(Icons.keyboard_arrow_up_sharp,),)
                                ),
                              ],
                            ),
                          ),
                        ),),
                        Obx(() =>
                        controller.isOp6.value == false ? Container() :
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 22),
                              padding: EdgeInsets.all(5),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 230,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.subData[controller
                                          .subDataIndex.value].fields![0]
                                          .values!.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            Container(
                                              child: Obx(() {
                                                return Checkbox(
                                                  onChanged: (value) {
                                                    controller.colorCheckBox.value = value as bool;
                                                  },
                                                value: controller.colorCheckBox.value);
                                              }),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: Text(
                                                "${controller.subData[index].fields![0].values![1]}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black
                                                ),),
                                            )
                                          ],
                                        );
                                      },),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(32, 193, 244, 1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Text("Apply",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_back, size: 20, color: Colors.grey,)),
            // this will hide Drawer hamburger icon
            actions: [
              Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.isFilterDrawer.value = false;
                        ScaffoldKey2.currentState!
                            .openEndDrawer();
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
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )),
                ],
              )
            ],
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
            title: controller.data.companyName == null
                ? Container(child: Text("N/A",
              style: TextStyle(fontSize: 20, color: Colors.orangeAccent),),)
                : Text(controller.data.companyName.toString(),
              style: GoogleFonts.roboto(
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),),
          body: Obx(
                () =>
            (controller.hasData.isFalse)
                ? Center(child: CircularProgressIndicator())
                : (isNullEmptyOrFalse(controller.mainProductList))
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      controller.isFilterDrawer.value=  true;;
                      ScaffoldKey2.currentState!.openEndDrawer();
                    }, child:
                    Row(children: [
                      Container(
                        child: Text("Filters",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.filter_list, color: Colors.black, size: 18,),
                    ],),),
                    SizedBox(width: 10,),
                    TextButton(onPressed: () {

                    }, child:
                    Row(children: [
                      Container(
                        child: Text("Sort By: ",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      DropdownButton(
                        value: 0,
                        onChanged: (value) {
                          value = controller.selectedValue;
                        }, items: [
                        DropdownMenuItem(child: Text(
                          "New Arrivals", textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),), value: 0,),
                        DropdownMenuItem(child: Text(
                          "Price: Low-High", style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),), value: 1,),
                        DropdownMenuItem(child: Text(
                          "Price: High-Low", style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),), value: 2,),
                        DropdownMenuItem(child: Text(
                          "Discount: Low-High", style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),), value: 3,),
                        DropdownMenuItem(child: Text(
                          "Discount: High-Low", style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),), value: 4,),
                      ],),
                    ],),),
                    SizedBox(width: 5,),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount:
                      controller.mainProductList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.VIEW_PRODUCT, arguments: controller.mainProductList[index]);
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 170,
                                                    height: 140,
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                    color: Colors
                                                        .white,
                                                    margin: EdgeInsets
                                                        .only(
                                                        top: 25,
                                                        left:
                                                        10,
                                                        right:
                                                        10),
                                                    child: CachedNetworkImage(
                                                        imageUrl: "${controller
                                                            .mainProductList[index]
                                                            .images![0]}",
                                                        imageBuilder: (context,
                                                            imageProvider) =>
                                                            Container(
                                                              decoration:
                                                              BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    colorFilter: ColorFilter
                                                                        .mode(
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
                                                            Expanded(
                                                                child: Container(
                                                                  color:
                                                                  Colors
                                                                      .grey[100],
                                                                ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double
                                                        .maxFinite,
                                                    height: 80,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .only(
                                                              left:
                                                              90),
                                                          height:
                                                          20,
                                                          width:
                                                          70,
                                                          decoration:
                                                          BoxDecoration(
                                                            color:
                                                            Colors.red,
                                                            borderRadius:
                                                            BorderRadius.only(
                                                              topLeft:
                                                              Radius.circular(
                                                                  20),
                                                              topRight:
                                                              Radius.circular(
                                                                  20),
                                                              bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                              bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                            ),
                                                          ),
                                                          child:
                                                          Center(
                                                            child:
                                                            Text(
                                                              "Save ${controller
                                                                  .mainProductList[index]
                                                                  .discount!
                                                                  .toStringAsFixed(
                                                                  0)} %",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  fontSize: 9),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 30,
                                    ),
                                    child: Align(
                                        alignment:
                                        Alignment.center,
                                        child: Text(
                                          "${controller.mainProductList[index]
                                              .sellerId!.companyName}",
                                          style:
                                          GoogleFonts.raleway(
                                              fontWeight:
                                              FontWeight
                                                  .w700,
                                              fontSize: 13,
                                              color: Color
                                                  .fromRGBO(
                                                  32,
                                                  193,
                                                  244,
                                                  1)),
                                        )),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 180,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        right: 25),
                                    child: Align(
                                        alignment:
                                        Alignment.center,
                                        child: Text(
                                          "${controller.mainProductList[index]
                                              .category!.name} - ${controller
                                              .mainProductList[index]
                                              .subCategory!
                                              .name} ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey),
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10),
                                        child: Text(
                                          "₹${controller.mainProductList[index]
                                              .price!.toStringAsFixed(2)}",
                                          style: GoogleFonts.roboto(
                                              decoration:
                                              TextDecoration
                                                  .lineThrough,
                                              color: Colors.grey,
                                              fontSize: 8),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        child: Text(
                                          "₹${controller.mainProductList[index]
                                              .discountedPrice!.toStringAsFixed(
                                              2)}",
                                          style: TextStyle(
                                              fontSize: 10),
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      RatingBarIndicator(
                                        rating: double.parse(
                                            controller
                                                .mainProductList[
                                            index]
                                                .rating
                                                .toString()),
                                        itemBuilder:
                                            (context, index) =>
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.all(0),
                                        itemSize: 10.0,
                                        direction:
                                        Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("${controller.mainProductList[index].sId}");
                                      controller.addToCart(
                                        data: controller.mainProductList[index],
                                      );
                                      controller.CartCount();
                                      controller.Countlist
                                          .refresh();
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius:
                                        BorderRadius.only(
                                          topRight:
                                          Radius.circular(25),
                                          bottomRight:
                                          Radius.circular(25),
                                          bottomLeft:
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                              Icons
                                                  .add_shopping_cart,
                                              color: Colors.white,
                                              size: 18),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "ADD TO CART",
                                            style: GoogleFonts
                                                .raleway(
                                              fontWeight:
                                              FontWeight.w700,
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.59)),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}