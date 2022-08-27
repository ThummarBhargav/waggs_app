import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/plane_controller.dart';

class PlaneView extends GetView<PlaneController> {
  const PlaneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                    // if ((box.read(
                                    //     ArgumentConstant.isUserLogin) ==
                                    //     null)) {
                                    //   Get.toNamed(Routes.LOGIN_SCREEN);
                                    //   scaffoldKey.currentState!
                                    //       .closeEndDrawer();
                                    // }
                                    // else {
                                    //   controller.CartProductApi();
                                    //   controller.CartCount();
                                    //   scaffoldKey.currentState!
                                    //       .openEndDrawer();
                                    // }
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    size: 25,
                                    color: Colors.grey[500],
                                  )),
                              // controller.count1.data == null
                              //     ? Container()
                              //     : Positioned(
                              //     left: 22,
                              //     top: 2,
                              //     child: Container(
                              //       width: 18,
                              //       height: 18,
                              //       alignment: Alignment.center,
                              //       decoration: BoxDecoration(
                              //         color: Color.fromRGBO(
                              //             32, 193, 244, 1),
                              //         shape: BoxShape.circle,
                              //       ),
                              //       child: Text(
                              //         "${controller.count1.data}",
                              //         style: GoogleFonts.raleway(
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.white),
                              //       ),
                              //     )),
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
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 60, left: 25),
                                    child: Text("Plans",
                                        style: GoogleFonts.roboto(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5, left: 25),
                                    child: Text("Home >",
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5,left: 2),
                                    child: Text("Subscription Package",
                                        style: GoogleFonts.roboto(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Text("SUBSCRIPTION  PLANS",
                        style: GoogleFonts.lato(fontWeight: FontWeight.w700,color: Colors.orange,fontSize: 20),),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: Text("Welcome to Waggs.in, your trustable ally in your search for quality food, supplements and toys for your pets. Created by loving pet parents themselves, "
                            "Waggs.in is born out of sheer passion, love and care for those better halves of our lives.",
                          style: GoogleFonts.actor(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 250.0,
                        width: 230.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/plan1.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(15),topLeft:Radius.circular(15),bottomRight:Radius.circular(15),topRight: Radius.circular(15)  ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text("TREAT YOUR DOG TO ROYALTY",
                        style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: Colors.orange,fontSize: 20),),
                      SizedBox(height: 15,),

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

//AssetImage("assets/catagory.jpg"),
//AssetImage("assets/ca.png"),