import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/constant/SizeConstant.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import '../../../../main.dart';
import '../../../constant/ConstantUrl.dart';
import '../../cart_drawer/views/cart_drawer_view.dart';
import '../controllers/view_product_controller.dart';

class ViewProductView extends GetWidget<ViewProductController> {
  var dropdownItems;
  @override
  CarouselController carouselController = CarouselController();

  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: Drawer(width: 250, child: CartDrawerView()),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_outlined)),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      if ((box.read(
                          ArgumentConstant.isUserLogin) ==
                          null)) {
                        Get.toNamed(Routes.LOGIN_SCREEN);
                      }
                      else {
                        scaffoldKey.currentState!.openEndDrawer();
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
                            color: Color.fromRGBO(32, 193, 244, 1),
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
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                    height: 250,
                    color: Colors.grey.shade200,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "NEW",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Save ${controller.data.discount!.toStringAsFixed(0)} %",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CachedNetworkImage(
                                    imageUrl: controller.url == ''
                                        ? "${controller.data.images![0]}"
                                        : "${controller.url}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
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
                                        ))),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 6.0, left: 6),
                                  child: Text(
                                    "${controller.data.title}",
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 6.0, left: 6, top: 10),
                                  child: Text(
                                    "${controller.data.description}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: RatingBarIndicator(
                                        rating:
                                            controller.data.rating!.toDouble(),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                    Text(
                                      controller.data.rating!.toStringAsFixed(1),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Text(
                                        " | ${controller.data.ratedBy} Rating ",
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\u{20B9}${controller.data.discountedPrice}.00",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        " - \u{20B9}",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Text("${controller.data.price}.00",
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "You Save : \u{20B9}${controller.data.price! - controller.data.discountedPrice!}"
                                    "(${controller.data.discount!.toStringAsFixed(0)}%)",
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 12),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 350,
                      height: 110,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.data.images!.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.url.value =
                                        controller.data.images![index];
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(15),
                                      width: 100,
                                      height: 150,
                                      color: Colors.grey.shade300,
                                      child: Image.network(
                                          width: 100,
                                          height: 100,
                                          "${controller.data.images![index]}")),
                                )
                              ],
                            );
                          })),
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 15.0, vertical: 10),
                  //       child: Text(
                  //         "Quantity",
                  //         style: TextStyle(
                  //             fontSize: 20,
                  //             color: Colors.lightBlue.shade300,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   height: 40,
                  //   width: 400,
                  //   child: ListView.builder(
                  //     itemCount: 1,
                  //     itemBuilder: (context, index) {
                  //       return Align(
                  //         alignment: Alignment.topLeft,
                  //         child: Container(
                  //           height: 34,
                  //           margin: EdgeInsets.only(
                  //               left: 8),
                  //           width:
                  //           MediaQuery.of(context)
                  //               .size
                  //               .width *
                  //               0.3,
                  //           padding: EdgeInsets.all(0),
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius:
                  //             BorderRadius.only(
                  //               topLeft:
                  //               Radius.circular(20),
                  //               topRight:
                  //               Radius.circular(20),
                  //               bottomRight:
                  //               Radius.circular(20),
                  //               bottomLeft:
                  //               Radius.circular(20),
                  //             ),
                  //             border: Border.all(
                  //               color: Colors
                  //                   .grey.shade400,
                  //               width: 1,
                  //             ),
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Expanded(
                  //                 child: InkWell(
                  //                     onTap: () {
                  //                       controller
                  //                           .UpdateCartRemove(
                  //                         data: controller
                  //                             .cartProductList[
                  //                         index],
                  //                       );
                  //                     },
                  //                     child: Padding(
                  //                       padding:
                  //                       const EdgeInsets
                  //                           .only(
                  //                           left:
                  //                           8.0,
                  //                           right:
                  //                           5),
                  //                       child: Icon(
                  //                         Icons.remove,
                  //                         color: Colors
                  //                             .black,
                  //                         size: 22,
                  //                       ),
                  //                     )),
                  //               ),
                  //               Expanded(
                  //                   child: Container(
                  //                     height: 75,
                  //                     width: 75,
                  //                     padding: EdgeInsets
                  //                         .symmetric(
                  //                         horizontal: 3,
                  //                         vertical: 2),
                  //                     decoration:
                  //                     BoxDecoration(
                  //                       color: Colors
                  //                           .grey.shade300,
                  //                       border: Border(
                  //                         left: BorderSide(
                  //                           color:
                  //                           Colors.grey,
                  //                           width: 1.0,
                  //                         ),
                  //                         right: BorderSide(
                  //                           color:
                  //                           Colors.grey,
                  //                           width: 1.0,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     child: Center(
                  //                         child: Text(
                  //                           "${controller.cartProductList[index].quantity}",
                  //                           style: TextStyle(
                  //                               color: Colors
                  //                                   .grey
                  //                                   .shade500,
                  //                               fontSize: 18,
                  //                               fontWeight:
                  //                               FontWeight
                  //                                   .w500),
                  //                         )),
                  //                   )),
                  //               Expanded(
                  //                 child: InkWell(
                  //                     onTap: () {
                  //                       controller
                  //                           .UpdateCartAdd(
                  //                         data: controller
                  //                             .cartProductList[
                  //                         index],
                  //                       );
                  //                     },
                  //                     child: Icon(
                  //                       Icons.add,
                  //                       color: Colors
                  //                           .black,
                  //                       size: 22,
                  //                     )),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0, top: 15),
                            child: GestureDetector(
                              onTap: () {
                                controller.addToCart(data: controller.data);
                              },
                              child: getcon(
                                text: Text(
                                  "ADD TO CART",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                color: Color(0xffDE8701),
                                width: 140,
                                height: 50,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 15),
                            child: getcon(
                              text: Text(
                                "BUY NOW",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              color: Colors.black,
                              width: 120,
                              height: 50,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 2, top: 8),
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                            border: Border.all(
                              color: Colors.lightBlue.shade300,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              size: 15,
                              color: Colors.blue.shade300,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6, right: 6, top: 8),
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                            border: Border.all(
                              color: Colors.lightBlue.shade300,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.share_outlined,
                                size: 17,
                                color: Colors.blue.shade300,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.isOpen.value = !controller.isOpen.value;
                      print(controller.isOpen.value);
                    },
                    child: Container(
                      margin: EdgeInsets.all(18),
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffDE8701),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Key Features",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          controller.isOpen.value == false
                              ? Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_up_sharp,
                                  color: Colors.white,
                                )
                        ],
                      ),
                    ),
                  ),
                  controller.isOpen.value == false
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(left: 22),
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Brand :  ",
                                      style: TextStyle(
                                          color: Colors.grey.shade600)),
                                  Text("${controller.data.brand}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              controller.data.lifeStage == null
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text("Life Stage : ",
                                            style: TextStyle(
                                                color: Colors.grey.shade600)),
                                        Text("${controller.data.lifeStage}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                              controller.data.productType == null
                                  ? Container()
                                  : SizedBox(
                                      height: 5,
                                    ),
                              controller.data.productType == null
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text("Product Type :  ",
                                            style: TextStyle(
                                                color: Colors.grey.shade600)),
                                        Text("${controller.data.productType}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                              controller.data.flavor == null
                                  ? Container()
                                  : SizedBox(
                                      height: 5,
                                    ),
                              controller.data.flavor == null
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text("Flavour :  ",
                                            style: TextStyle(
                                                color: Colors.grey.shade600)),
                                        Text("${controller.data.flavor}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                              controller.data.breedSize == null
                                  ? Container()
                                  : SizedBox(
                                      height: 5,
                                    ),
                              controller.data.breedSize == null
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text("Breed Size  :  ",
                                            style: TextStyle(
                                                color: Colors.grey.shade600)),
                                        Text("${controller.data.breedSize}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              controller.data.vegNonveg == null
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text("Veg / Non Veg :  ",
                                            style: TextStyle(
                                                color: Colors.grey.shade600)),
                                        Text("${controller.data.vegNonveg}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              controller.data.color == null
                                  ? Container()
                                  : Row(
                                      children: [
                                        Text("Color :  ",
                                            style: TextStyle(
                                                color: Colors.grey.shade600)),
                                        Text("${controller.data.color}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                            ],
                          )),

                  InkWell(
                    onTap: () {
                      controller.isOpen1.value = !controller.isOpen1.value;
                      print(controller.isOpen1.value);
                    },
                    child: Container(
                      margin: EdgeInsets.all(18),
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffDE8701),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Seller Details",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          controller.isOpen1.value == false
                              ? Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_up_sharp,
                                  color: Colors.white,
                                )
                        ],
                      ),
                    ),
                  ),
                  controller.isOpen1.value == false
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(left: 22),
                          padding: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${controller.data.sellerId!.companyName}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              Text("${controller.data.sellerId!.address}",
                                  style:
                                      TextStyle(color: Colors.grey.shade600)),
                            ],
                          )),
                  //
                  // SizedBox(height: 30),
                  // Container(
                  //     margin: EdgeInsets.only(left: 10),
                  //     alignment: Alignment.topLeft,
                  //     child: Text("- YOU MIGHT ALSO LIKE",
                  //       style: TextStyle(color: Colors.orangeAccent,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold),)),
                  // Container(
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(left: 5),
                  //         height: 270,
                  //         width: 400,
                  //         child: (controller.mainProductList.isEmpty)
                  //             ? Center(child: CircularProgressIndicator(),)
                  //             : GridView.builder(
                  //             itemCount: 4,
                  //             scrollDirection: Axis.horizontal,
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               return Card(
                  //                 elevation: 2,
                  //                 child: GestureDetector(
                  //                   onTap: () {
                  //                     print("object");
                  //                     Get.toNamed(Routes.VIEW_PRODUCT,arguments: controller.mainProductList[index]);
                  //                     // Get.toNamed(Routes.VIEW_PRODUCT,
                  //                     //     arguments: controller
                  //                     //         .mainProductList[index]);
                  //                   },
                  //                   child: Container(
                  //                     child: Column(
                  //                       children: [
                  //                         Container(
                  //                           child: Column(
                  //                             children: [
                  //                               Stack(
                  //                                 children: [
                  //                                   Container(
                  //                                     child: Column(
                  //                                       children: [
                  //                                         Container(
                  //                                           width: 120,
                  //                                           height: 120,
                  //                                           alignment:
                  //                                           Alignment
                  //                                               .center,
                  //                                           color:
                  //                                           Colors.white,
                  //                                           margin: EdgeInsets
                  //                                               .only(
                  //                                               top: 25,
                  //                                               left: 20,
                  //                                               right:
                  //                                               10),
                  //                                           child:
                  //                                           CachedNetworkImage(
                  //                                               imageUrl:
                  //                                               "${controller
                  //                                                   .mainProductList[index]
                  //                                                   .images![0]}",
                  //                                               imageBuilder:
                  //                                                   (
                  //                                                   context,
                  //                                                   imageProvider) =>
                  //                                                   Container(
                  //                                                     decoration: BoxDecoration(
                  //                                                       image: DecorationImage(
                  //                                                           image: imageProvider,
                  //                                                           fit: BoxFit
                  //                                                               .cover,
                  //                                                           colorFilter: ColorFilter
                  //                                                               .mode(
                  //                                                               Colors
                  //                                                                   .transparent,
                  //                                                               BlendMode
                  //                                                                   .colorBurn)),
                  //                                                     ),
                  //                                                   ),
                  //                                               placeholder:
                  //                                                   (
                  //                                                   context,
                  //                                                   url) =>
                  //                                                   CircularProgressIndicator(),
                  //                                               errorWidget: (
                  //                                                   context,
                  //                                                   url,
                  //                                                   error) =>
                  //                                                   Expanded(
                  //                                                       child: Container(
                  //                                                         color:
                  //                                                         Colors
                  //                                                             .grey[100],
                  //                                                       ))),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   ),
                  //                                   Positioned(
                  //                                     child: Column(
                  //                                       children: [
                  //                                         Container(
                  //                                           width: double
                  //                                               .maxFinite,
                  //                                           height: 80,
                  //                                           child: Row(
                  //                                             mainAxisAlignment:
                  //                                             MainAxisAlignment
                  //                                                 .center,
                  //                                             children: [
                  //                                               Container(
                  //                                                 margin: EdgeInsets
                  //                                                     .only(
                  //                                                     left:
                  //                                                     45),
                  //                                                 height: 20,
                  //                                                 width: 70,
                  //                                                 decoration:
                  //                                                 BoxDecoration(
                  //                                                   color: Colors
                  //                                                       .red,
                  //                                                   borderRadius:
                  //                                                   BorderRadius
                  //                                                       .only(
                  //                                                     topLeft:
                  //                                                     Radius
                  //                                                         .circular(
                  //                                                         20),
                  //                                                     topRight:
                  //                                                     Radius
                  //                                                         .circular(
                  //                                                         20),
                  //                                                     bottomRight:
                  //                                                     Radius
                  //                                                         .circular(
                  //                                                         20),
                  //                                                     bottomLeft:
                  //                                                     Radius
                  //                                                         .circular(
                  //                                                         20),
                  //                                                   ),
                  //                                                 ),
                  //                                                 child:
                  //                                                 Center(
                  //                                                   child:
                  //                                                   Text(
                  //                                                     "Save ${controller
                  //                                                         .mainProductList[index]
                  //                                                         .discount!
                  //                                                         .toStringAsFixed(
                  //                                                         2)} %",
                  //                                                     style: TextStyle(
                  //                                                         color:
                  //                                                         Colors
                  //                                                             .white,
                  //                                                         fontWeight: FontWeight
                  //                                                             .bold,
                  //                                                         fontSize: 9),
                  //                                                   ),
                  //                                                 ),
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                   )
                  //                                 ],
                  //                               )
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Container(
                  //                           margin: EdgeInsets.only(
                  //                             // left: 20,
                  //                             top: 5, left: 5,
                  //                           ),
                  //                           child: Align(
                  //                               alignment: Alignment.center,
                  //                               child: Text(
                  //                                 "${controller
                  //                                     .mainProductList[index]
                  //                                     .sellerId!
                  //                                     .companyName}",
                  //                                 style: GoogleFonts
                  //                                     .raleway(
                  //                                     fontWeight:
                  //                                     FontWeight.w700,
                  //                                     fontSize: 13,
                  //                                     color: Color.fromRGBO(
                  //                                         32, 193, 244, 1)),
                  //                               )),
                  //                         ),
                  //                         Container(
                  //                           height: 20,
                  //                           width: 180,
                  //                           alignment: Alignment.center,
                  //                           margin:
                  //                           EdgeInsets.only(),
                  //                           child: Align(
                  //                               alignment: Alignment.center,
                  //                               child: Text(
                  //                                 "${controller
                  //                                     .mainProductList[index]
                  //                                     .category!
                  //                                     .name} - ${controller
                  //                                     .mainProductList[index]
                  //                                     .subCategory!.name} ",
                  //                                 style: TextStyle(
                  //                                     fontSize: 10,
                  //                                     color: Colors.grey),
                  //                               )),
                  //                         ),
                  //                         Row(
                  //                           mainAxisAlignment: MainAxisAlignment
                  //                               .start,
                  //                           children: [
                  //                             Container(
                  //                               margin: EdgeInsets.only(
                  //                                 left: 15,),
                  //                               child: Text(
                  //                                 "₹${controller
                  //                                     .mainProductList[index]
                  //                                     .price!
                  //                                     .toStringAsFixed(2)}",
                  //                                 style: GoogleFonts.roboto(
                  //                                     decoration:
                  //                                     TextDecoration
                  //                                         .lineThrough,
                  //                                     color: Colors.grey,
                  //                                     fontSize: 8),
                  //                               ),
                  //                             ),
                  //                             SizedBox(
                  //                               width: 3,
                  //                             ),
                  //                             Container(
                  //                               child: Text(
                  //                                 "₹${controller
                  //                                     .mainProductList[index]
                  //                                     .discountedPrice}",
                  //                                 style:
                  //                                 TextStyle(fontSize: 9),
                  //                               ),
                  //                             ),
                  //                             RatingBarIndicator(
                  //                               rating: double.parse(
                  //                                   controller
                  //                                       .mainProductList[index]
                  //                                       .rating
                  //                                       .toString()),
                  //                               itemBuilder:
                  //                                   (context, index) =>
                  //                                   Icon(
                  //                                     Icons.star,
                  //                                     color: Colors.amber,
                  //                                   ),
                  //                               itemCount: 5,
                  //                               itemSize: 15.0,
                  //                               direction: Axis.horizontal,
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         SizedBox(
                  //                           height: 10,
                  //                         ),
                  //                         InkWell(
                  //                           onTap: () {},
                  //                           child: Container(
                  //                             width: 130,
                  //                             height: 35,
                  //                             alignment: Alignment.center,
                  //                             decoration: BoxDecoration(
                  //                               color: Colors.cyan,
                  //                               borderRadius:
                  //                               BorderRadius.only(
                  //                                 topRight:
                  //                                 Radius.circular(25),
                  //                                 bottomRight:
                  //                                 Radius.circular(25),
                  //                                 bottomLeft:
                  //                                 Radius.circular(25),
                  //                               ),
                  //                             ),
                  //                             child: Row(
                  //                               children: [
                  //                                 SizedBox(
                  //                                   width: 10,
                  //                                 ),
                  //                                 Icon(
                  //                                     Icons
                  //                                         .add_shopping_cart,
                  //                                     color: Colors.white,
                  //                                     size: 18),
                  //                                 SizedBox(
                  //                                   width: 10,
                  //                                 ),
                  //                                 Text(
                  //                                   "ADD TO CART",
                  //                                   style:
                  //                                   GoogleFonts.raleway(
                  //                                     fontWeight:
                  //                                     FontWeight.w700,
                  //                                     fontSize: 12,
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //             gridDelegate:
                  //             SliverGridDelegateWithFixedCrossAxisCount(
                  //                 crossAxisCount: 1,
                  //                 childAspectRatio: 1.54)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
