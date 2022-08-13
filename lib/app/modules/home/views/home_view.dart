import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/Catagory_Page/views/catagory_page_view.dart';
import 'package:waggs_app/app/modules/Storage_All_Products/views/storage_all_products_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
            body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/logo111.png"),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 212,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TextFormField(
                              controller: controller.searchController,
                              decoration: InputDecoration(
                                hintText: "Search Product...",
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                prefixIconColor: Colors.grey[200],
                                focusColor: Colors.grey,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu,
                                color: Colors.grey[500],
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.cyan,
                      child: Row(
                        children: List.generate(controller.CatagoryList.length,
                            (index) {
                          return Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    controller.CatagoryList[index].sId;
                                    print(
                                        "sId: ${controller.CatagoryList[index].sId}");
                                    controller.productList.clear();
                                    controller.mainProductList
                                        .forEach((element) {
                                      if (element.category!.sId ==
                                              controller
                                                  .CatagoryList[index].sId &&
                                          element.subCategory!.categoryId ==
                                              controller
                                                  .CatagoryList[index].sId) {
                                        controller.productList.add(element);
                                      }
                                    });
                                    // controller.productList.forEach((element) {
                                    //   print(element.subCategory!.name);
                                    // });
                                    controller.SubCatagoryList.forEach((element) {
                                      if(element.categoryId==controller.CatagoryList[index].sId){
                                        controller.subData.add(element);
                                      }else{

                                      }
                                    });
                                    controller.productList.refresh();
                                    // Get.to(CatagoryPageView(controller.CatagoryList[index]));

                                    Get.to(CatagoryPageView(
                                        data: controller.CatagoryList[index],subCategory: controller.subData[index],));

                                    print(
                                        "SId:- ${controller.CatagoryList[index].sId}");
                                  },
                                  child: Text(
                                    "${controller.CatagoryList[index].name} +",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(child: Image.asset("assets/poster.JPG"))
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "TOP SELLING STORES",
                            style: GoogleFonts.roboto(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(StorageAllProductsView());
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 23, bottom: 10),
                            child: Text(
                              "View All ",
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 400,
                      height: 280,
                      child: GridView.builder(
                          itemCount: controller.SellersList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 180,
                                              height: 130,
                                              alignment: Alignment.center,
                                              color: Colors.white,
                                              margin: EdgeInsets.only(top: 25,
                                                  left: 10, right: 10),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "${controller.SellersList[index].logoUrl}",
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
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
                                                    (context, url, error) => Expanded(child: Container(
                                                      color: Colors.grey[100],)
                                                    )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: 150,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${controller.SellersList[index].companyName}",
                                            style: GoogleFonts.raleway(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    32, 193, 244, 1)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        height: 40,
                                        width: 200,
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${controller.SellersList[index].address}",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                      InkWell(
                                        onTap: () {

                                        },
                                        child: Container(
                                          width: 130,
                                          height: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.cyan,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                            ),
                                          ),
                                          child: Text("SHOP NOW",style: GoogleFonts.raleway(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                              color: Colors.white,),
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
                                  crossAxisCount: 1,childAspectRatio: 1.3)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "TOP SELLING PRODUCTS",
                            style: GoogleFonts.roboto(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: 400,
                            child: GridView.builder(
                                itemCount: controller.TopProductlist.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 2,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        height: 128,
                                                        width: 200,
                                                        margin: EdgeInsets.only(left: 30),
                                                        child: CachedNetworkImage(
                                                          imageUrl:
                                                              "${controller.TopProductlist[index].images![0]}",
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              image: DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit.fill,
                                                                  colorFilter:
                                                                      ColorFilter.mode(
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
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width:
                                                                  double.maxFinite,
                                                              height: 30,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    margin:
                                                                        EdgeInsets
                                                                            .only(left: 90),
                                                                    height: 20,
                                                                    width: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft: Radius
                                                                            .circular(
                                                                                20),
                                                                        topRight: Radius
                                                                            .circular(
                                                                                20),
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                20),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                20),
                                                                      ),
                                                                    ),
                                                                    child: Center(
                                                                      child: Text(
                                                                        "Save ${controller.TopProductlist[index].discount!.toStringAsFixed(2)} %",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                            fontSize:
                                                                                9),
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
                                              margin: EdgeInsets.only(right: 30,top: 10),
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "${controller.TopProductlist[index].sellerId!.companyName}",
                                                    style: GoogleFonts.raleway(
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 18,
                                                        color: Color.fromRGBO(
                                                            32, 193, 244, 1)),
                                                  )),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 180,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(right: 30),
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "${controller.TopProductlist[index].category!.name} - ${controller.TopProductlist[index].subCategory!.name} ",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  )),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(left: 50),
                                                  child: Text(
                                                    "₹${controller.TopProductlist[index].price!.toStringAsFixed(2)}",
                                                    style: GoogleFonts.roboto(
                                                        decoration: TextDecoration
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
                                                    "₹${controller.TopProductlist[index].discountedPrice!.toStringAsFixed(2)}",
                                                    style: TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                RatingBar.builder(
                                                  initialRating: double.parse(
                                                      controller
                                                          .TopProductlist[index]
                                                          .rating
                                                          .toString()),
                                                  minRating: 0,
                                                  updateOnDrag: false,
                                                  unratedColor: Colors.grey,
                                                  glowColor: Colors.transparent,
                                                  maxRating: 5,
                                                  glow: false,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: false,
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  tapOnlyMode: false,
                                                  ignoreGestures: false,
                                                  itemPadding: EdgeInsets.symmetric(
                                                      horizontal: 0),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                  itemBuilder: (context, index) {
                                                    return Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            InkWell(
                                              onTap: () {

                                              },
                                              child: Container(
                                                width: 180,
                                                height: 40,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.cyan,
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(25),
                                                    bottomRight: Radius.circular(25),
                                                    bottomLeft: Radius.circular(25),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 22,),
                                                    Icon(Icons.add_shopping_cart,color: Colors.white,size: 18),
                                                    SizedBox(width: 10,),
                                                    Text("ADD TO CART",style: GoogleFonts.raleway(
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 15,
                                                      color: Colors.white,),
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
                                        crossAxisCount: 1,childAspectRatio: 1.15)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
      }),
    );
  }
}
