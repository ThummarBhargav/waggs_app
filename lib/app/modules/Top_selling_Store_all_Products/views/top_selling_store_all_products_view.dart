import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/modules/product_detail_view/views/product_detail_view_view.dart';

import '../controllers/top_selling_store_all_products_controller.dart';

class TopSellingStoreAllProductsView
    extends GetView<TopSellingStoreAllProductsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 100,
                child: DrawerHeader(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text("Filters",
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.radioGValues.close();
                      },
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
              ListTile(
                title: Text("Price",
                  style: GoogleFonts.raleway(
                    fontSize: 20,
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
                    fontSize: 20,
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
                            fontSize: 20,
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
                                margin: EdgeInsets.only(top: 8),
                                child: Obx(() {
                                  return Radio(
                                    onChanged: (value) {
                                      controller.radioGValues.value =
                                      value as String;
                                      controller.radioGValues.value!=null?controller.isOp2.value==true:false;
                                      controller.isOp2.value = true;
                                      controller.SubCatagoryList[index].sId;
                                      print("SID : ${controller.SubCatagoryList[index].sId}");

                                    },
                                    value: controller.CatagoryList[index].name,
                                    groupValue: controller.radioGValues.value,);
                                }),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 8),
                                child: Text(
                                  "${controller.CatagoryList[index].name}",
                                  style: GoogleFonts.raleway(
                                      fontSize: 18,
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
              Obx(() => controller.isOp2.value == false ? Container():InkWell(
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
                            fontSize: 20,
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
              Obx(() => controller.isOp1.value == false ? Container():
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
                          height: 210,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.SubCatagoryList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Obx(() {
                                      return Radio(
                                        onChanged: (value) {
                                          controller.radioGValues.value =
                                          value as String;
                                        },
                                        value: controller.SubCatagoryList[index].name,
                                        groupValue: controller.radioGValues.value,);
                                    }),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 8),
                                    child: Text(
                                      "${controller.SubCatagoryList[index].name}",
                                      style: GoogleFonts.raleway(
                                          fontSize: 18,
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
              )
            ],
          ),
        ),
        appBar: AppBar(
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
                    Scaffold.of(context).openEndDrawer();
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
                    Container(
                      child: Text("New Arrivals",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black,
                      size: 18,),
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
                            Get.to(ProductDetailViewView(
                                controller.mainProductList[index]));
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
                                                        margin: EdgeInsets.only(
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
                                                            Radius.circular(20),
                                                            topRight:
                                                            Radius.circular(20),
                                                            bottomRight:
                                                            Radius.circular(20),
                                                            bottomLeft:
                                                            Radius.circular(20),
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
                                            .mainProductList[index].subCategory!
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
                                      itemSize: 15.0,
                                      direction:
                                      Axis.horizontal,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {},
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
      ),
    );
  }
}
