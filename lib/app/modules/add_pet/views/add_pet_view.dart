import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';

import '../controllers/add_pet_controller.dart';

class AddPetView extends GetView<AddPetController> {
  const AddPetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(()=>Scaffold(
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
                      SizedBox(height: 5,),
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
                          color: Colors.grey[200],
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
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Pet Name',
                            labelStyle: TextStyle(fontSize: 20,color: Colors.cyan),
                          ),
                          // decoration: InputDecoration(
                          //   hintText: "Pet Name ",
                          //   hintStyle: GoogleFonts.roboto(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          //   enabledBorder: InputBorder.none,
                          //   focusedBorder: InputBorder.none,
                          // ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                          width: 400,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child:DropdownButton(
                            items: controller.gender.map((element) => DropdownMenuItem(
                            child: new Text("${element}"),
                            value: element,
                          )).toList(),
                            onChanged: (value) {
                              controller.select.value=value.toString();
                          },
                            hint: Text("${controller.select.value}"),
                          )
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 15, right: 5),
                              padding: EdgeInsets.only(
                                left: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: TextFormField(
                                controller: controller.age,
                                keyboardType: TextInputType.emailAddress,
                                // validator: (input) => !isNullEmptyOrFalse(input)
                                //     ? null
                                //     : "Please Enter Email Address",
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Age(In Years)',
                                  labelStyle: TextStyle(fontSize: 15,color: Colors.cyan),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(left: 5, right: 15),
                              padding: EdgeInsets.only(
                                left: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: TextFormField(
                                controller: controller.breed,
                                keyboardType: TextInputType.emailAddress,
                                // validator: (input) => !isNullEmptyOrFalse(input)
                                //     ? null
                                //     : "Please Enter Email Address",
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Breed',
                                  labelStyle: TextStyle(fontSize: 15,color: Colors.cyan),
                                ),
                                // decoration: InputDecoration(
                                //   hintText: "Pet Name ",
                                //   hintStyle: GoogleFonts.roboto(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                //   enabledBorder: InputBorder.none,
                                //   focusedBorder: InputBorder.none,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: (){
                           controller.UpdatePet();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: getcon(
                              color: Colors.orange,
                              text: Text("SUBMIT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                              alignment: Alignment.center,
                              height: 40,
                              width: 140
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),)
    );
  }
}
