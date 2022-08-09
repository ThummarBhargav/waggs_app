import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
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
                            Row(
                              children: [
                                SizedBox(width: 100,),
                                Container(
                                  height: 26,
                                  width: 30,
                                  margin: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/profile.png",),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 26,
                                  width: 30,
                                  margin: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/notification.png",),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 26,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/cart.png",),
                                    ),
                                  ),
                                ),
                              ],
                            )
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
                    ImageSlideshow(
                      width: double.infinity,
                      height: 400,
                      initialPage: 0,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      onPageChanged: (value) {
                        debugPrint('Page changed: $value');
                      },
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: [
                        Image.asset(
                          'assets/image1.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/image2.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/image3.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "-TOP SELLING STORES",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 22),
                          ),
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
                                    Container(
                                      height: 75,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${controller.productList[index].images![0]}"))),
                                    ),
                                    Container(
                                      height: 50,
                                      child: Text(
                                          "${controller.productList[index].category!.name}"),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.cyan,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50),
                                              ),
                                            ),
                                            child: TextButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add_shopping_cart,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "ADD TO CART",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
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
