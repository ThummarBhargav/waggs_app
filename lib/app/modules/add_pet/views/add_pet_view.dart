import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/add_pet_controller.dart';

class AddPetView extends GetView<AddPetController> {
  const AddPetView({Key? key}) : super(key: key);
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
                                    child: Text("My Pets",
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
                                    child: Text("My Pets >",
                                        style: GoogleFonts.roboto(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade600
                                        )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5,left: 2),
                                    child: Text("Edit Pets",
                                        style: GoogleFonts.roboto(
                                            fontSize: 10,
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
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("FILL PET DETAILS",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500,fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            color: Colors.grey.shade200,
                            height: 180,
                            width: 180,
                            child: Center(child: Text("+ Pet Image",style: TextStyle(color: Colors.cyan,fontSize: 15),)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        padding: EdgeInsets.only(
                          left: 15,
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
                           controller: controller.name,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (input) => !isNullEmptyOrFalse(input)
                          //     ? null
                          //     : "Please Enter Email Address",
                          decoration: InputDecoration(
                            hintText: "Pet Name ",
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
