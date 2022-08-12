import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/view-product/views/view_product_view.dart';
import '../../../constant/SizeConstant.dart';
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
                              margin: EdgeInsets.only(left: 15,right: 15),
                              padding: EdgeInsets.only(left: 15,),
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
                                validator: (input) => !isNullEmptyOrFalse(input)
                                    ? null
                                    : "Please Enter Your First Name",
                                decoration: InputDecoration(
                                  hintText: "Search Product...",
                                  hintStyle: GoogleFonts.roboto(
                                    fontSize: 16,
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
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.menu,color: Colors.grey[500],))
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
                          child: Text("View All ",
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: Colors.grey,
                          ),),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
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
                                      Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 150,
                                                alignment: Alignment.center,
                                                color: Colors.grey[200],
                                                margin: EdgeInsets.only(left: 10,right: 10),
                                                child: Image.network(width: 100,height:100,
                                                    "${controller.productList[index].images![0]}",
                                                ),
                                              ),
                                              Positioned(child: Container(color: Colors.cyan,))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 50)),
                        ],
                      ),
                    ),
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
