import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/ConstantUrl.dart';
import 'package:waggs_app/app/constant/productCard_const.dart';
import 'package:waggs_app/app/constant/shopcard_const.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';
import 'package:waggs_app/app/modules/Catagory_Page/views/catagory_page_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';
import 'package:waggs_app/main.dart';
import '../../cart_drawer/views/cart_drawer_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SafeArea(
            child: Obx(() {
              controller.Countlist.refresh();
              controller.cartProductList.refresh();
              return Scaffold(
                  key: controller.scaffoldKey,
                  // endDrawer: FilterView(),
                  endDrawer: Drawer(
                      width: 280,
                      child: controller.isFilterDrawer.isFalse
                          ? CartDrawerView()
                          : ListView(
                              children: [
                                Container(
                                  height: 122,
                                  child: DrawerHeader(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(32, 193, 244, 1)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                margin:
                                                    EdgeInsets.only(left: 25),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle),
                                                child: IconButton(
                                                    onPressed: () {
                                                      if ((box.read(
                                                              ArgumentConstant
                                                                  .isUserLogin) ==
                                                          null)) {
                                                        Get.toNamed(Routes
                                                            .LOGIN_SCREEN);
                                                      } else {}
                                                      // Get.toNamed(Routes.LOGIN_SCREEN);
                                                    },
                                                    icon: Icon(
                                                      Icons.person_outline,
                                                      color: Color.fromRGBO(
                                                          32, 193, 244, 1),
                                                      size: 28,
                                                    )),
                                              ),
                                              Expanded(
                                                child: box.read(ArgumentConstant
                                                            .isUserLogin) ==
                                                        null
                                                    ? Text(
                                                        " Sign  In ",
                                                        style: GoogleFonts.aleo(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    : Text(
                                                        "${box.read(ArgumentConstant.email)}",
                                                        maxLines: 2,
                                                        style: GoogleFonts.aleo(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              )
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
                                        onTap: () {
                                          Get.toNamed(Routes.PLANE, arguments: {
                                            ArgumentConstant.isFromDrawer: true
                                          });
                                        },
                                        child: ListTile(
                                          leading:
                                              Icon(Icons.discount_outlined),
                                          title: Text(
                                            'Alpha Club',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if ((box.read(ArgumentConstant
                                                  .isUserLogin) ==
                                              null)) {
                                            Get.offAndToNamed(
                                                Routes.LOGIN_SCREEN);
                                          } else {
                                            controller.CartProductApi();
                                            controller.CartCount();
                                            Get.toNamed(Routes.VIEW_CART);
                                            controller.scaffoldKey.currentState!
                                                .closeEndDrawer();
                                          }
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                              Icons.shopping_cart_outlined),
                                          title: Text(
                                            'My Cart',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if ((box.read(ArgumentConstant
                                                  .isUserLogin) ==
                                              null)) {
                                            Get.offAndToNamed(
                                                Routes.LOGIN_SCREEN);
                                          } else {
                                            // controller.Allorder();
                                            Get.toNamed(Routes.ORDER_PAGE,
                                                arguments: {
                                                  ArgumentConstant.orderData:
                                                      [],
                                                });
                                            controller.scaffoldKey.currentState!
                                                .closeEndDrawer();
                                          }
                                        },
                                        child: ListTile(
                                          leading:
                                              Icon(Icons.drive_folder_upload),
                                          title: Text(
                                            'My Order',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if ((box.read(ArgumentConstant
                                                  .isUserLogin) ==
                                              null)) {
                                            Get.offAndToNamed(
                                                Routes.LOGIN_SCREEN);
                                            controller.scaffoldKey.currentState!
                                                .closeEndDrawer();
                                          } else {
                                            Get.toNamed(Routes.MY_PET);
                                          }
                                        },
                                        child: ListTile(
                                          leading: Icon(Icons.pets_outlined),
                                          title: Text(
                                            'My Pets',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if ((box.read(ArgumentConstant
                                                  .isUserLogin) ==
                                              null)) {
                                            Get.toNamed(Routes.LOGIN_SCREEN);
                                          } else {
                                            controller.CartProductApi();
                                            controller.CartCount();
                                            Get.offAndToNamed(
                                                Routes.MY_ACCOUNT);
                                            controller.scaffoldKey.currentState!
                                                .closeEndDrawer();
                                          }
                                        },
                                        child: ListTile(
                                          leading: Icon(
                                              Icons.account_circle_outlined),
                                          title: Text(
                                            'My Account',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      box.read(ArgumentConstant.isUserLogin) ==
                                              null
                                          ? SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                Get.offAndToNamed(
                                                    Routes.NOTIFICATION_PAGE);
                                                controller
                                                    .scaffoldKey.currentState!
                                                    .closeEndDrawer();
                                              },
                                              child: ListTile(
                                                leading: Icon(Icons
                                                    .notifications_none_outlined),
                                                title: Text(
                                                  'My Notification',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ),
                                      InkWell(
                                        onTap: () {
                                          Get.defaultDialog(
                                            title: "Delete Account",
                                            middleText:
                                                'Are you sure you want to delete your account ?',
                                            textCancel: "Cancel",
                                            textConfirm: "Confirm",
                                            confirmTextColor: Colors.white,
                                            cancelTextColor: Colors.cyan,
                                            buttonColor: Colors.cyan,
                                            onCancel: () {
                                              Get.back();
                                            },
                                            onConfirm: () {
                                              // box.erase();
                                              // Get.offAllNamed(Routes.HOME);
                                            },
                                          );
                                        },
                                        child: box.read(ArgumentConstant
                                                    .isUserLogin) ==
                                                null
                                            ? SizedBox()
                                            : ListTile(
                                                leading: Icon(Icons.delete),
                                                title: Text(
                                                  'Delete Account',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.defaultDialog(
                                            title: "Log Out",
                                            middleText:
                                                'Are You Sure To Log Out ?',
                                            textCancel: "cancel",
                                            textConfirm: "Confirm",
                                            confirmTextColor: Colors.white,
                                            cancelTextColor: Colors.cyan,
                                            buttonColor: Colors.cyan,
                                            onCancel: () {
                                              Get.back();
                                            },
                                            onConfirm: () {
                                              box.erase();
                                              Get.offAllNamed(Routes.HOME);
                                            },
                                          );
                                        },
                                        child: box.read(ArgumentConstant
                                                    .isUserLogin) ==
                                                null
                                            ? SizedBox()
                                            : ListTile(
                                                leading: Icon(Icons.logout),
                                                title: Text(
                                                  'Log Out',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
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
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 15),
                                      child: Text(
                                        "Contact Us",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 25),
                                      child: Text(
                                        "Legal",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 15),
                                      child: Text(
                                        "Help",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                  body: GestureDetector(
                    onTap: () =>
                        FocusScope.of(context).requestFocus(new FocusNode()),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/logo111.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            height: 50,
                                            // width: ,
                                            margin: EdgeInsets.only(left: 15),
                                            padding: EdgeInsets.only(bottom: 10
                                                // left: 10,
                                                ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                            ),
                                            child: TextFormField(
                                              controller:
                                                  controller.searchController,
                                              // focusNode: controller.myFocusNode,
                                              onFieldSubmitted: (value) {
                                                Get.offAndToNamed(
                                                    Routes.SEARCH_PRODUCT_PAGE,
                                                    arguments: {
                                                      ArgumentConstant
                                                          .searchProduct: value
                                                    });
                                              },
                                              decoration: InputDecoration(
                                                hintText: "Search Product...",
                                                hintStyle: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                prefixIcon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0),
                                                  child: Icon(Icons.search),
                                                ),
                                                prefixIconColor:
                                                    Colors.grey[200],
                                                focusColor: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Spacer(),
                                        Expanded(
                                            flex: 1,
                                            child: Stack(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                      if ((box.read(
                                                              ArgumentConstant
                                                                  .isUserLogin) ==
                                                          null)) {
                                                        Get.toNamed(Routes
                                                            .LOGIN_SCREEN);
                                                      } else {
                                                        controller
                                                            .CartProductApi();
                                                        controller.CartCount();
                                                        controller
                                                            .isFilterDrawer
                                                            .value = false;
                                                        controller.scaffoldKey
                                                            .currentState!
                                                            .openEndDrawer();
                                                      }
                                                    },
                                                    icon: Icon(
                                                      Icons.shopping_cart,
                                                      size: 25,
                                                      color: Colors.grey[500],
                                                    )),
                                                (controller.count1.data == 0 ||
                                                        controller
                                                                .count1.data ==
                                                            null)
                                                    ? Container()
                                                    : Positioned(
                                                        left: 22,
                                                        top: 2,
                                                        child: Container(
                                                          width: 18,
                                                          height: 18,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    32,
                                                                    193,
                                                                    244,
                                                                    1),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Text(
                                                            "${controller.count1.data}",
                                                            style: GoogleFonts
                                                                .raleway(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        )),
                                              ],
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                              onPressed: () {
                                                controller.isFilterDrawer
                                                    .value = true;
                                                controller
                                                    .scaffoldKey.currentState!
                                                    .openEndDrawer();
                                              },
                                              icon: Icon(
                                                Icons.person,
                                                color: Colors.grey[500],
                                              )),
                                        ),
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
                                  color: Color.fromRGBO(32, 193, 244, 1),
                                  child: Row(
                                    children: List.generate(
                                        controller.CatagoryList.length,
                                        (index) {
                                      return Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                controller
                                                    .CatagoryList[index].sId;
                                                print(
                                                    "sId: ${controller.CatagoryList[index].sId}");
                                                controller.productList.clear();
                                                controller.mainProductList
                                                    .forEach((element) {
                                                  if (element.category!.sId ==
                                                          controller
                                                              .CatagoryList[
                                                                  index]
                                                              .sId &&
                                                      element.subCategory!
                                                              .categoryId ==
                                                          controller
                                                              .CatagoryList[
                                                                  index]
                                                              .sId) {
                                                    controller.productList
                                                        .add(element);
                                                  }
                                                });
                                                controller.subData.clear();
                                                controller.SubCatagoryList
                                                    .forEach((element) {
                                                  if (element.categoryId ==
                                                      controller
                                                          .CatagoryList[index]
                                                          .sId) {
                                                    controller.subData
                                                        .add(element);
                                                    print("Data" +
                                                        element.name
                                                            .toString());
                                                  } else {}
                                                });
                                                controller.productList
                                                    .refresh();
                                                Get.to(CatagoryPageView(
                                                  data: controller
                                                      .CatagoryList[index],
                                                  subData: controller.subData,
                                                ));
                                                print(
                                                    "SId:- ${controller.CatagoryList[index].sId}");
                                              },
                                              child: Text(
                                                "${controller.CatagoryList[index].name} +",
                                                style: TextStyle(
                                                    color: Colors.white),
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
                            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            child: Column(
                              children: [
                                controller.bannerList.isEmpty
                                    ? CircularProgressIndicator()
                                    : Container(
                                        padding: EdgeInsets.only(
                                            top: 25, bottom: 15),
                                        // color: Colors.greenAccent,
                                        child: CarouselSlider.builder(
                                          itemCount:
                                              controller.bannerList.length,
                                          options: CarouselOptions(
                                            height: 200,
                                            enlargeCenterPage: true,
                                            autoPlay: true,
                                            autoPlayInterval:
                                                Duration(seconds: 4),
                                            reverse: false,
                                            viewportFraction: 1.0,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index, int realIndex) {
                                            return Image.network(
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              },
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.fitWidth,
                                              "${controller.bannerList[index].mobileImage}",
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, bottom: 10),
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
                                              ArgumentConstant
                                                  .isFromSellingStore: true,
                                              ArgumentConstant
                                                  .isFromSubCategory: false,
                                              ArgumentConstant
                                                  .isFromTopProducts: false,
                                              ArgumentConstant.sellerList:
                                                  controller.SellersList,
                                            });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 23, bottom: 10),
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
                                        return shopCard(
                                            image: controller
                                                .SellersList[index].logoUrl,
                                            companyName: controller
                                                .SellersList[index].companyName,
                                            address: controller
                                                .SellersList[index].address,
                                            onTap: () {
                                              Get.toNamed(
                                                  Routes
                                                      .TOP_SELLING_STORE_ALL_PRODUCTS,
                                                  arguments: controller
                                                      .SellersList[index]);
                                            },
                                            ButtonText: "SHOP NOW");
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, bottom: 10),
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
                                              ArgumentConstant
                                                  .isFromSellingStore: false,
                                              ArgumentConstant
                                                  .isFromSubCategory: false,
                                              ArgumentConstant
                                                  .isFromTopProducts: true,
                                              ArgumentConstant.TopProductlist:
                                                  controller.TopProductlist,
                                            });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 23, bottom: 10),
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
                                (controller.hastopproduct.isFalse)
                                    ? Container(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : (controller.TopProductlist.isEmpty)
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
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20,
                                                      color: Color.fromRGBO(
                                                          33, 43, 54, 1)),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.37,
                                                  width: 400,
                                                  child: GridView.builder(
                                                      itemCount: controller
                                                          .TopProductlist
                                                          .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return productCard(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .VIEW_PRODUCT,
                                                                  arguments:
                                                                      controller
                                                                              .TopProductlist[
                                                                          index]);
                                                            },
                                                            image: controller
                                                                .TopProductlist[
                                                                    index]
                                                                .images![0],
                                                            discount: controller
                                                                .TopProductlist[
                                                                    index]
                                                                .discount!
                                                                .toStringAsFixed(
                                                                    0),
                                                            companyName: controller
                                                                .TopProductlist[
                                                                    index]
                                                                .title,
                                                            categoryName: controller
                                                                .TopProductlist[
                                                                    index]
                                                                .category!
                                                                .name,
                                                            subCategoryName: controller
                                                                .TopProductlist[
                                                                    index]
                                                                .subCategory!
                                                                .name,
                                                            price:
                                                                controller.TopProductlist[index].price
                                                                    .toString(),
                                                            discountedPrice: controller
                                                                .TopProductlist[index]
                                                                .discountedPrice
                                                                .toString(),
                                                            rating: controller.TopProductlist[index].rating.toString(),
                                                            ButtonText: "ADD TO CART",
                                                            ButtonTap: () {
                                                              controller.addToCart(
                                                                  data: controller
                                                                          .TopProductlist[
                                                                      index]);
                                                            },
                                                            icon: Icons.add_shopping_cart,
                                                            isShipping: (int.parse(controller.TopProductlist[index].sellerId!.shippingLimit.toString()) <= controller.TopProductlist[index].sellerId!.distance) ? true : false);
                                                      },
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 1,
                                                              childAspectRatio:
                                                                  1.54)),
                                                ),
                                              ],
                                            ),
                                          ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
          );
        });
  }
}
