import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/CategoryModel.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../Modal/SubCategoryModel.dart';
import '../../../constant/ConstantUrl.dart';

class CatagoryPageView extends GetWidget<HomeController> {
  CategoryData data;
  RxList<SubCategoryData> subData;
  CatagoryPageView({required this.data,required this.subData});
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                  Expanded(
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.CartDeleteApi(
                                                data: controller.cartProductList[index],
                                                // data1:controller.TopProductlist[index],
                                              );
                                            },
                                            icon: Icon(
                                              Icons.delete_rounded,
                                              color: Colors.cyan,
                                            ))
                                      ],
                                    ),
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
                                  Obx(
                                        () => Align(
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
                                                    // if (controller
                                                    //     .count.value >
                                                    //     0) {
                                                    //   controller
                                                    //       .count.value--;
                                                    // }
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
              height: 60,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: () {
                            Get.back();
                          }, icon: Icon(Icons.keyboard_backspace_outlined))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 200,),
                          IconButton(onPressed: () {
                          }, icon: Icon(Icons.search,size: 25,color: Colors.grey,)),
                          Stack(
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
                          ),
                          SizedBox(width: 8,),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        padding: EdgeInsets.all(100),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/catagory.jpg"),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20,right: 20),
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/ca.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 45,left: 30),
                            child: Text(data.name.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffeb9d4f)
                                )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 468,
                    child: ListView.builder(
                      itemCount: subData.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("${controller.imageList[index]}"),
                                      fit: BoxFit.fill
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.PRODUCT_LIST_SCREEN,arguments: {
                                        ArgumentConstant.isFromSellingStore : false,
                                        ArgumentConstant.isFromSubCategory : true,
                                        ArgumentConstant.isFromTopProducts : false,
                                        ArgumentConstant.subcategoryData : subData[index],
                                      });

                                      // Get.toNamed(Routes.PRODUCT,arguments: subData[index]);
                                    },
                                    child: Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 60,right: 40),
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xffeb9d4f),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(25),
                                            bottomRight: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          ),
                                        ),
                                        child: Text("${subData[index].name}",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
