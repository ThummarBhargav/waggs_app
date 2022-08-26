import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/CategoryModel.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../Modal/SubCategoryModel.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/SizeConstant.dart';

class CatagoryPageView extends GetWidget<HomeController> {
  CategoryData data;
  RxList<SubCategoryData> subData;
  CatagoryPageView({required this.data, required this.subData});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(init:HomeController(),builder: (Controller) {
      return SafeArea(
        child: Obx(() {
          return Scaffold(
            key: scaffoldKey,
            endDrawer: Drawer(
                width: 280,
                child: controller.isFilterDrawer.isFalse
                    ? Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DrawerHeader(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(32, 193, 244, 1)),
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
                        child: (controller.hasData.isFalse)
                            ? Center(child: CircularProgressIndicator())
                            : (isNullEmptyOrFalse(controller.cartProductList))
                            ? Center(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 300,
                                width: 250,
                                child: SvgPicture.asset(
                                    "assets/NoData.svg"),
                              ),
                              Text(
                                "No data found",
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color.fromRGBO(
                                        33, 43, 54, 1)),
                              ),
                            ],
                          ),
                        )
                            : ListView.builder(
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
                                              "${controller
                                                  .cartProductList[index]
                                                  .product!.images![0]}",
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
                                                  Container(
                                                    color: Colors
                                                        .grey[100],
                                                  )),
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
                                                "${controller
                                                    .cartProductList[index]
                                                    .product!.title}",
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
                                          MediaQuery
                                              .of(context)
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
                                                      (controller
                                                          .cartProductList[
                                                      index]
                                                          .quantity ==
                                                          1)
                                                          ? controller
                                                          .CartDeleteApi(
                                                          data: controller
                                                              .cartProductList[
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
                                                          "${controller
                                                              .cartProductList[index]
                                                              .quantity}",
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
                                          "\u{20B9}${controller
                                              .cartProductList[index].product!
                                              .discountedPrice! *
                                              controller.cartProductList[index]
                                                  .quantity!}.00",
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
                                      Get.toNamed(Routes.TAB_BAR1);
                                      // Get.toNamed(Routes.TAB_BAR1);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 8, right: 8),
                                      child: getcon(
                                          alignment: Alignment.center,
                                          color: Color.fromRGBO(
                                              32, 193, 244, 1),
                                          height: 30,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
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
                )
                    : ListView(
                  children: [
                    Container(
                      height: 122,
                      child: DrawerHeader(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(32, 193, 244, 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 25),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.person_outline,
                                          color: Color.fromRGBO(
                                              32, 193, 244, 1),
                                          size: 28,
                                        )),
                                  ),
                                  Container(
                                    height: 30,
                                    margin: EdgeInsets.only(
                                        top: 10, left: 25),
                                    child: box.read(
                                        ArgumentConstant.isUserLogin) == null
                                        ? Text(
                                      " Sign  In ",
                                      style: GoogleFonts.aleo(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    )
                                        : Text(
                                      "${box.read(ArgumentConstant.email)}",
                                      style: GoogleFonts.aleo(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.white,),
                                    ),)
                                ],
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: Icon(Icons.widgets_outlined),
                              title: Text('All Categories',
                                style: TextStyle(fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: ListTile(
                              leading: Icon(Icons.discount_outlined),
                              title: Text(
                                'Alpha Clube', style: TextStyle(fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.TAB_BAR1);
                            },
                            child: ListTile(
                              leading: Icon(Icons.shopping_cart_outlined),
                              title: Text(
                                'My Cart', style: TextStyle(fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: Icon(Icons.drive_folder_upload),
                              title: Text(
                                'My Order', style: TextStyle(fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: Icon(Icons.pets_outlined),
                              title: Text(
                                'My pets', style: TextStyle(fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.MY_ACCOUNT);
                            },
                            child: ListTile(
                              leading: Icon(Icons.account_circle_outlined),
                              title: Text(
                                'My Account', style: TextStyle(fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: Icon(Icons.notifications_none_outlined),
                              title: Text('My Notification',
                                style: TextStyle(fontSize: 15),),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: ListTile(
                              leading: Icon(Icons.favorite_border_outlined),
                              title: Text(
                                'My Wishlist', style: TextStyle(fontSize: 15),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 2,
                      color: Colors.grey.shade500,
                      endIndent: 2,
                      thickness: 1.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 15),
                          child: Text("Contact us", style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 25),
                          child: Text("legal", style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 15),
                          child: Text("Help", style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),),
                        )
                      ],
                    )
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
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // SizedBox(width: 200,),
                              IconButton(onPressed: () {},
                                  icon: Icon(
                                    Icons.search, size: 25,
                                    color: Colors.grey,)),

                              Stack(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        if ((box.read(
                                            ArgumentConstant.isUserLogin) ==
                                            null)) {
                                          Get.toNamed(Routes.LOGIN_SCREEN);
                                          scaffoldKey.currentState!
                                              .closeEndDrawer();
                                        }
                                        else {
                                          controller.CartProductApi();
                                          controller.CartCount();
                                          scaffoldKey.currentState!
                                              .openEndDrawer();
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
                Expanded(
                  child: SingleChildScrollView(
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
                                  margin: EdgeInsets.only(top: 20, right: 20),
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
                                  margin: EdgeInsets.only(top: 45, left: 30),
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
                        ListView.builder(
                          itemCount: subData.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${controller.imageList[index]}"),
                                          fit: BoxFit.fill
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                              Routes.PRODUCT_LIST_SCREEN,
                                              arguments: {
                                                ArgumentConstant
                                                    .isFromSellingStore: false,
                                                ArgumentConstant
                                                    .isFromSubCategory: true,
                                                ArgumentConstant
                                                    .isFromTopProducts: false,
                                                ArgumentConstant
                                                    .subcategoryData: subData[index],
                                              });

                                          // Get.toNamed(Routes.PRODUCT,arguments: subData[index]);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 60, right: 40),
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xffeb9d4f),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(
                                                  25),
                                              topRight: Radius.circular(25),
                                            ),
                                          ),
                                          child: Text(
                                            "${subData[index].name}",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}
