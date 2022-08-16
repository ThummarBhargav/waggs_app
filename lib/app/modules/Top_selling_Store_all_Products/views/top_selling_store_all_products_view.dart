import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/modules/product_detail_view/views/product_detail_view_view.dart';
import 'package:waggs_app/app/modules/view-product/views/view_product_view.dart';

import '../controllers/top_selling_store_all_products_controller.dart';

class TopSellingStoreAllProductsView
    extends GetView<TopSellingStoreAllProductsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,shadowColor: Colors.transparent,iconTheme: IconThemeData(color: Colors.black),
          title: controller.data.companyName==null?Container(child: Text("N/A",style: TextStyle(fontSize:20,color: Colors.orangeAccent),),):Text(controller.data.companyName.toString(),
          style: GoogleFonts.roboto(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),),
        body: Obx(
          () => (controller.hasData.isFalse)
              ? Center(child: CircularProgressIndicator())
              : (isNullEmptyOrFalse(controller.mainProductList))
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 300,
                            width: 250,
                            child: SvgPicture.asset("assets/NODATA.svg"),
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
                                Icon(Icons.filter_list,color: Colors.black,size: 18,),
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
                              Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,size: 18,),
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
                                       Get.to(ProductDetailViewView(controller.mainProductList[index]));
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
                                                                imageUrl: "${controller.mainProductList[index].images![0]}",
                                                                imageBuilder: (context, imageProvider) => Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
                                                                      ),
                                                                    ),
                                                                placeholder: (context, url) => CircularProgressIndicator(),
                                                                errorWidget: (context, url, error) => Expanded(
                                                                        child: Container(
                                                                      color:
                                                                          Colors.grey[100],
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
                                                                      "Save ${controller.mainProductList[index].discount!.toStringAsFixed(0)} %",
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.bold,
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
                                                  "${controller.mainProductList[index].sellerId!.companyName}",
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
                                                  "${controller.mainProductList[index].category!.name} - ${controller.mainProductList[index].subCategory!.name} ",
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
                                                  "₹${controller.mainProductList[index].price!.toStringAsFixed(2)}",
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
                                                  "₹${controller.mainProductList[index].discountedPrice!.toStringAsFixed(2)}",
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
