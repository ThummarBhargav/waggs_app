import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/Add_To_Cart_Shipping_View/views/add_to_cart_shipping_view_view.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../constant/SizeConstant.dart';
import '../../View_All_My_Cart/controllers/view_all_my_cart_controller.dart';
import '../../View_All_My_Cart/views/view_all_my_cart_view.dart';
import '../controllers/tab_bar1_controller.dart';

class TabBar1View extends GetView<TabBar1Controller> {
  const TabBar1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>SafeArea(
        child:  Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: () {
              Get.back();
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
            actions: [
              IconButton(onPressed: () {

              }, icon: Icon(Icons.search,color: Colors.black,)),
              // IconButton(onPressed: () {
              //
              // }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,))
            ],
            bottom:TabBar(
              onTap: (index){
                controller.activeIndex.value = index;
                print("i==>${controller.activeIndex.value}");
              },
              controller: controller.tabController,
              indicatorColor:Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(child:Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: controller.activeIndex.value==0?Colors.orange:Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.location_on_outlined,color: Colors.white,),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("STEP 1",
                              style: GoogleFonts.raleway(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color:Color.fromRGBO(32, 193, 244, 1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5,top: 1),
                            child: Text("DELIVERY ADDRESS",
                              style: GoogleFonts.raleway(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color:controller.activeIndex.value==0? Colors.orange:Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),),
                Tab(child:Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: controller.activeIndex.value==1? Colors.orange:Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.local_shipping_outlined,color: Colors.white,),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("STEP 2",
                              style: GoogleFonts.raleway(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(32, 193, 244, 1),
                              ),
                            ),
                          ),
                          Container(
                            child: Text("SHIPPING",
                              style: GoogleFonts.raleway(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: controller.activeIndex.value==1? Colors.orange:Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                Tab(child:Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: controller.activeIndex.value==2? Colors.orange:Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.payment,color: Colors.white,),
                    ),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("STEP 3",
                            style: GoogleFonts.raleway(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(32, 193, 244, 1),
                            ),
                          ),
                        ),
                        Container(
                          child: Text("PAYMENT",
                            style: GoogleFonts.raleway(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: controller.activeIndex.value==2? Colors.orange:Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )) ,
                  ],
                ),),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
              controller: controller.tabController,
            children: [
              ViewAllMyCartView(),

              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        )
    ));
  }
}
