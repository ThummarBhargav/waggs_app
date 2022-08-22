import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/modules/Catagory_Page/views/catagory_page_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/main.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Obx(() {
        controller.Countlist.refresh();
        controller.cartProductList.refresh();
        return Scaffold(
            key: scaffoldKey,
            endDrawer: Drawer(
                width: 250,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DrawerHeader(
                          decoration: BoxDecoration(color: Colors.blue),
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
                        child: ListView.builder(
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
                                                    margin: EdgeInsets.all(10),
                                                    height: 80,
                                                    width: 80,
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
                                                      Expanded(
                                                          child: Container(
                                                        color: Colors.grey[100],
                                                      ))),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${controller.cartProductList[index].product!.title}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w800),
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
                                                    data: controller.cartProductList[index],
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete_rounded,
                                                color: Colors.cyan,
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
                                            margin: EdgeInsets.only(left: 8),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            padding: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
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
                                                        if (controller
                                                                .count.value >
                                                            0) {
                                                          controller
                                                              .count.value--;
                                                        }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                right: 5),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.black,
                                                          size: 22,
                                                        ),
                                                      )),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  height: 75,
                                                  width: 75,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    border: Border(
                                                      left: BorderSide(
                                                        //                   <--- left side
                                                        color: Colors.grey,
                                                        width: 1.0,
                                                      ),
                                                      right: BorderSide(
                                                        //                    <--- top side
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
                                                            FontWeight.w500),
                                                  )),
                                                )),
                                                Expanded(
                                                  child: InkWell(
                                                      onTap: () {
                                                        // controller
                                                        //     .count.value++;
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

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "\u{20B9}${controller.cartProductList[index].product!.discountedPrice}.00",
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
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
                                  Text("00"),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 8, right: 8),
                                child: getcon(
                                    alignment: Alignment.center,
                                    color: Colors.cyan,
                                    height: 30,
                                    width: MediaQuery.of(context).size.width,
                                    text: Text(
                                      "VIEW CART",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ))
                  ],
                )),
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
                          Expanded(
                            child: Row(
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
                                  height: 40,
                                  width: 190,
                                  margin: EdgeInsets.only(left: 15),
                                  padding: EdgeInsets.only(bottom: 10
                                      // left: 10,
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
                                        fontSize: 12,
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
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.menu,
                                        color: Colors.grey[500],
                                      )),
                                ),
                                Expanded(
                                    child: Stack(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          scaffoldKey.currentState!
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
                                ))
                              ],
                            ),
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
                            children: List.generate(
                                controller.CatagoryList.length, (index) {
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
                                                  controller.CatagoryList[index]
                                                      .sId &&
                                              element.subCategory!.categoryId ==
                                                  controller.CatagoryList[index]
                                                      .sId) {
                                            controller.productList.add(element);
                                          }
                                        });
                                        controller.subData.clear();
                                        controller.SubCatagoryList.forEach(
                                            (element) {
                                          if (element.categoryId ==
                                              controller
                                                  .CatagoryList[index].sId) {
                                            controller.subData.add(element);
                                            print("Data" +
                                                element.name.toString());
                                          } else {}
                                        });
                                        controller.productList.refresh();
                                        Get.to(CatagoryPageView(
                                          data: controller.CatagoryList[index],
                                          subData: controller.subData,
                                        ));
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
                        controller.bannerList.isEmpty?CircularProgressIndicator()
                        :Container(
                          padding: EdgeInsets.only(top: 25, bottom: 15),
                          // color: Colors.greenAccent,
                          child: CarouselSlider.builder(
                            itemCount: controller.bannerList.length,
                            options: CarouselOptions(
                              height: 180,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 4),
                              reverse: false,
                              viewportFraction: 1.0,
                            ),
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              return Image.network(
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                                "${controller.bannerList[index].image}",
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                "TOP SELLING STORES",
                                style: GoogleFonts.roboto(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.PRODUCT_LIST_SCREEN,
                                    arguments: {
                                      ArgumentConstant.isFromSellingStore: true,
                                      ArgumentConstant.isFromSubCategory: false,
                                      ArgumentConstant.isFromTopProducts: false,
                                      ArgumentConstant.sellerList:
                                          controller.SellersList,
                                    });
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
                          margin: EdgeInsets.only(left: 5),
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
                                                  width: 130,
                                                  height: 130,
                                                  alignment: Alignment.center,
                                                  color: Colors.white,
                                                  margin: EdgeInsets.only(
                                                      top: 25,
                                                      left: 10,
                                                      right: 10),
                                                  child: CachedNetworkImage(
                                                      imageUrl:
                                                          "${controller.SellersList[index].logoUrl}",
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
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
                                                              child: Container(
                                                            color: Colors
                                                                .grey[100],
                                                          ))),
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
                                              child: controller
                                                          .SellersList[index]
                                                          .companyName ==
                                                      null
                                                  ? Container(
                                                      child: Text(
                                                        "N/A",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromRGBO(
                                                                    32,
                                                                    193,
                                                                    244,
                                                                    1)),
                                                      ),
                                                    )
                                                  : Text(
                                                      "${controller.SellersList[index].companyName}",
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
                                                    ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5),
                                            height: 40,
                                            width: 200,
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: controller
                                                            .SellersList[index]
                                                            .address ==
                                                        null
                                                    ? Text(
                                                        "N/A",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.grey),
                                                      )
                                                    : Text(
                                                        "${controller.SellersList[index].address}",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.grey),
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  Routes
                                                      .TOP_SELLING_STORE_ALL_PRODUCTS,
                                                  arguments: controller
                                                      .SellersList[index]);
                                            },
                                            child: Container(
                                              width: 130,
                                              height: 35,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.cyan,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  bottomRight:
                                                      Radius.circular(25),
                                                  bottomLeft:
                                                      Radius.circular(25),
                                                ),
                                              ),
                                              child: Text(
                                                "SHOP NOW",
                                                style: GoogleFonts.raleway(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                ),
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
                                      crossAxisCount: 1,
                                      childAspectRatio: 1.59)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                "TOP SELLING PRODUCTS",
                                style: GoogleFonts.roboto(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.PRODUCT_LIST_SCREEN,
                                    arguments: {
                                      ArgumentConstant.isFromSellingStore:
                                          false,
                                      ArgumentConstant.isFromSubCategory: false,
                                      ArgumentConstant.isFromTopProducts: true,
                                      ArgumentConstant.TopProductlist:
                                          controller.TopProductlist,
                                    });
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
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 270,
                                width: 400,
                                child: GridView.builder(
                                    itemCount: controller.TopProductlist.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.VIEW_PRODUCT,
                                                arguments: controller
                                                    .TopProductlist[index]);
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
                                                                  width: 120,
                                                                  height: 120,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  color: Colors
                                                                      .white,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              25,
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              10),
                                                                  child: CachedNetworkImage(
                                                                      imageUrl: "${controller.TopProductlist[index].images![0]}",
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
                                                                                45),
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
                                                                            "Save ${controller.TopProductlist[index].discount!.toStringAsFixed(2)} %",
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
                                                    // left: 20,
                                                    top: 5, left: 5,
                                                  ),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${controller.TopProductlist[index].sellerId!.companyName}",
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
                                                  height: 20,
                                                  width: 180,
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${controller.TopProductlist[index].category!.name} - ${controller.TopProductlist[index].subCategory!.name} ",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.grey),
                                                      )),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        left: 15,
                                                      ),
                                                      child: Text(
                                                        "₹${controller.TopProductlist[index].price!.toStringAsFixed(2)}",
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
                                                        "₹${controller.TopProductlist[index].discountedPrice}",
                                                        style: TextStyle(
                                                            fontSize: 9),
                                                      ),
                                                    ),
                                                    RatingBarIndicator(
                                                      rating: double.parse(
                                                          controller
                                                              .TopProductlist[
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
                                                  onTap: () {
                                                    print("${controller.TopProductlist[index].sId}");
                                                    print("Bearer ${box.read(ArgumentConstant.token)}");
                                                    controller.addToCart(
                                                        data: controller
                                                                .TopProductlist[
                                                            index]);
                                                    controller.CartCount();
                                                    controller.Countlist
                                                        .refresh();
                                                    controller.CartProductApi();
                                                    controller.cartProductList
                                                        .refresh();
                                                  },
                                                  child: Container(
                                                    width: 130,
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
                                                          width: 10,
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
                                                            fontSize: 12,
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
                                            crossAxisCount: 1,
                                            childAspectRatio: 1.54)),
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

//   Container(
//                           padding: EdgeInsets.only(top: 15, bottom: 15),
//                           // color: Colors.greenAccent,
//                           child: CarouselSlider.builder(
//                             itemCount: controller.bannerList.length,
//                             options: CarouselOptions(
//                               height: 180,
//                               enlargeCenterPage: true,
//                               autoPlay: true,
//                               autoPlayInterval: Duration(seconds: 3),
//                               reverse: false,
//                               aspectRatio: 5.0,
//                             ),
//                             itemBuilder: (BuildContext context, int index,
//                                 int realIndex) {
//                               return Container(
//                                 color: Colors.black,
//                                 child: Image.network(
//                                     width: 350,
//                                     fit: BoxFit.fill,
//                                     "${controller.bannerList[index].image}"),
//                               );
//                             },
//                           ),
//                         ),
