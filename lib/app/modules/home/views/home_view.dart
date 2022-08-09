import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/view-product/views/view_product_view.dart';
import '../controllers/home_controller.dart';
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
            body: SingleChildScrollView(
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
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {

                              },
                              child: Image.asset(
                                'assets/logo111.png',
                                width: 100,
                                height: 60,
                                alignment: Alignment.topLeft,
                              ),
                            ),
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
                          children:
                              List.generate(controller.CatagoryList.length, (index) {
                            return Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      controller.CatagoryList.forEach((element) {
                                        element.isSelected!.value = false;
                                      });
                                      controller.CatagoryList
                                      [index].isSelected!.value = true;
                                      controller.CatagoryList[index].sId;
                                      print("sId: ${controller.CatagoryList[index].sId}");
                                      controller.productList.clear();
                                      controller.mainProductList.forEach((element) {
                                        if(element.category!.sId == controller.CatagoryList[index].sId&&element.subCategory!.categoryId == controller.CatagoryList[index].sId){
                                         controller.productList.add(element);
                                        }
                                      });
                                      controller.productList.refresh();
                                    },
                                    child: Text(
                                      "${controller.CatagoryList[index].name}+"+"",
                                      style: TextStyle(color: (controller.CatagoryList[index].isSelected!.value)?Colors.black:Colors.white),
                                    )),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
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
                              fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 23,bottom: 10),
                          child: Text("View All",
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Colors.grey,
                          ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GridView.builder(
                            itemCount: controller.productList.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(ViewProductView(index));
                                },
                                child: Column(
                                  children: [
                                    Expanded(flex: 3,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 25,right: 25),
                                        padding: EdgeInsets.only(top: 10,bottom: 10),
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("${controller.productList[index].sellerId!.name}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan
                                            ),),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(flex: 2,
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text("${controller.productList[index].sellerId!.address}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text("${controller.productList[index].sellerId!.city} ,",
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text("${controller.productList[index].sellerId!.state} ,",
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text("${controller.productList[index].sellerId!.country} ,",
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),),
                                    Expanded(child: Row(
                                      children: [

                                      ],
                                    ))
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
      }),
    );
  }
}
