import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/constant/sizeConstant.dart';

import '../controllers/add_pet_controller.dart';

class AddPetView extends GetWidget<AddPetController> {
  const AddPetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        body: (controller.hasData.isFalse)
            ? Center(
                child: CircularProgressIndicator(color: Colors.orange),
              )
            : Form(
                key: controller.formKey,
                child: Column(
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
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                          Icons.keyboard_backspace_outlined))
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // SizedBox(width: 200,),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.search,
                                        size: 25,
                                        color: Colors.grey,
                                      )),

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
                                  SizedBox(
                                    width: 8,
                                  ),
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
                                      fit: BoxFit.fill),
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
                                        margin:
                                            EdgeInsets.only(top: 60, left: 25),
                                        child: Text("Edit Pets",
                                            style: GoogleFonts.roboto(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange,
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 25),
                                        child: Text("Home >",
                                            style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 2),
                                        child: Text("My Pets >",
                                            style: GoogleFonts.roboto(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade600)),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 2),
                                        child: Text("Edit Pet",
                                            style: GoogleFonts.roboto(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade600)),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "FILL PET DETAILS",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 190,
                              width: 190,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      openImagePicker(
                                              context: context,
                                              controller: controller)
                                          .then((value) {
                                        if (!isNullEmptyOrFalse(value)) {
                                          controller.pickedFile = value!.obs;
                                          controller.isImagePicked.value = true;
                                          controller.pickedFile!.refresh();
                                          controller.createImageSlot(
                                              context: context);
                                        }
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      color: Colors.grey.shade200,
                                      height: 180,
                                      width: 180,
                                      child: (!isNullEmptyOrFalse(
                                              controller.imageUrl.value))
                                          ? getImageByLink(
                                              height: 180,
                                              width: 180,
                                              url: controller.imageUrl.value,
                                              boxFit: BoxFit.cover,
                                            )
                                          : Center(
                                              child: Text(
                                              "+ Pet Image",
                                              style: TextStyle(
                                                  color: Colors.cyan,
                                                  fontSize: 15),
                                            )),
                                    ),
                                  ),
                                  if (!isNullEmptyOrFalse(
                                      controller.imageUrl.value))
                                    Positioned(
                                      top: 20,
                                      right: 25,
                                      child: InkWell(
                                        onTap: () {
                                          controller.isImagePicked.value =
                                              false;
                                          controller.imageUrl.value = "";
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
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
                              keyboardType: TextInputType.text,
                              // validator: (input) => !isNullEmptyOrFalse(input)
                              //     ? null
                              //     : "Please Enter Email Address",
                              validator: (val) {
                                if (isNullEmptyOrFalse(val)) {
                                  return "Please enter name";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Pet Name',
                                labelStyle:
                                    TextStyle(fontSize: 20, color: Colors.cyan),
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
                          SizedBox(
                            height: 15,
                          ),
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
                              child: DropdownButton(
                                items: controller.gender
                                    .map((element) => DropdownMenuItem(
                                          child: new Text("${element}"),
                                          value: element,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.select.value = value.toString();
                                },
                                hint: Text("${controller.select.value}"),
                              )),
                          SizedBox(
                            height: 15,
                          ),
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
                                    keyboardType: TextInputType.number,
                                    // validator: (input) => !isNullEmptyOrFalse(input)
                                    //     ? null
                                    //     : "Please Enter Email Address",
                                    validator: (val) {
                                      if (isNullEmptyOrFalse(val)) {
                                        return "Please enter age";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Age(In Years)',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
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
                                    validator: (val) {
                                      if (isNullEmptyOrFalse(val)) {
                                        return "Please enter breed";
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Breed',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.cyan),
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
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.updatePet(context: context);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: getcon(
                                  color: Colors.orange,
                                  text: Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 140),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
      );
    }));
  }

  Future<XFile?> openImagePicker({
    required BuildContext context,
    required AddPetController controller,
  }) async {
    return await controller.picker.pickImage(source: ImageSource.gallery);
  }
}

//GetBuilder<AddPetController>(builder: (controller){
