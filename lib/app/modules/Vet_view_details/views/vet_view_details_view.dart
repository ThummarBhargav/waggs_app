import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';

import '../../../constant/SizeConstant.dart';
import '../controllers/vet_view_details_controller.dart';

class VetViewDetailsView extends GetView<VetViewDetailsController> {
  const VetViewDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Obx((){
        return  Scaffold(
          body: Container(
            child: (controller.hasData.isFalse)?
                Center(child: CircularProgressIndicator(),)
                :Column(
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
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        size: 25,
                                        color: Colors.grey[500],
                                      )),
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
                      child: Container(
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
                                        image:
                                        AssetImage("assets/catagory.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin:
                                      EdgeInsets.only(top: 20, right: 20),
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
                                          margin: EdgeInsets.only(
                                              top: 60, left: 25),
                                          child: Text("Dr. ${controller.vetData.name}",
                                              style: GoogleFonts.roboto(
                                                fontSize: 20,
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
                                          child: Text("Dr. ${controller.vetData.name}",
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
                            Container(
                              padding: EdgeInsets.only(top: 25,left: 15,right: 15),
                           child: Column(
                             children: [
                               Container(
                                  // color: Colors.cyan,
                                 margin: EdgeInsets.only(top: 10,right: 10),
                                 height: 180,
                                 width: 180,
                                 child: getImageByLink(
                                   url: controller
                                       .vetData.logoUrl
                                       .toString(),
                                   boxFit: BoxFit.cover,
                                   height: 100,
                                   width: 150,
                                 ),
                               ),
                               SizedBox(height: 15,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Dr. ${controller.vetData.name}",
                                   style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),
                                   ),
                                   SizedBox(height: 10,),
                                   Row(
                                     children: [
                                       RatingBarIndicator(
                                         rating:
                                         controller.vetData.rating!.toDouble(),
                                         itemBuilder: (context, index) => Icon(
                                           Icons.star,
                                           color: Colors.amber,
                                         ),
                                         itemCount: 5,
                                         itemSize: 20.0,
                                         direction: Axis.horizontal,
                                       ),
                                       SizedBox(width: 8,),
                                       Text(
                                         controller.vetData.rating!.toStringAsFixed(1),
                                         style: TextStyle(fontSize: 15,color: Colors.grey.shade500),
                                       ),
                                       Text(
                                           " | ${controller.vetData.ratedBy} Reviews",
                                           style: TextStyle(fontSize: 12,color: Colors.grey.shade500)),
                                     ],
                                   ),
                                   SizedBox(height: 5,),
                                   Divider(
                                     indent: 2,
                                     color: Colors.grey.shade300,
                                     endIndent: 2,
                                     thickness: 1.5,
                                   ),
                                   SizedBox(height: 10,),
                                   Text("${controller.vetData.degree}",style: TextStyle(color: Colors.grey.shade600,fontSize: 15),),
                                   SizedBox(height: 10,),
                                   Text("${controller.vetData.experience} years of professional experience",
                                   style: GoogleFonts.lato(fontWeight: FontWeight.w800,fontSize: 16),
                                   ),
                                   SizedBox(height: 5,),
                                   Divider(
                                     indent: 2,
                                     color: Colors.grey.shade300,
                                     endIndent: 2,
                                     thickness: 1.5,
                                   ),
                                   SizedBox(height: 10,),
                                   Row(
                                     children: [
                                       Icon(Icons.phone,color: Colors.cyan,),
                                       Text(" (+91) ${controller.vetData.mobile}",style: TextStyle(fontSize: 18,color: Colors.cyan,
                                       fontWeight: FontWeight.w600),)
                                     ],
                                   ),
                                   SizedBox(height: 15,),
                                   Row(
                                     children: [
                                       Icon(Icons.mail,color: Colors.cyan,),
                                       SizedBox(width: 10,),
                                       Text("${controller.vetData.email}",style:TextStyle(fontSize: 18,color: Colors.cyan,
                                           fontWeight: FontWeight.w700),)
                                     ],
                                   ),
                                 SizedBox(height: 20,),
                                 Container(
                                 width: 250,
                                 height: 50,
                                 padding: EdgeInsets.only(left: 8),
                                 decoration: BoxDecoration(
                                   color: Colors.orange,
                                   borderRadius: BorderRadius.only(
                                     topRight: Radius.circular(25),
                                     bottomRight: Radius.circular(25),
                                     bottomLeft: Radius.circular(25),
                                   ),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                   Icon(Icons.date_range,color: Colors.white,),
                                   SizedBox(width: 8,),
                                   Text("BOOK APPOINMENT",style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.w600,
                                     fontSize: 16
                                   ),)
                                 ],)),
                                   Row(
                                     children: [
                                       Container(
                                         height: 200,
                                         width: 200,
                                         padding: EdgeInsets.all(100),
                                         // width: double.infinity,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                               image: AssetImage("assets/linkdin.png"),
                                               fit: BoxFit.fill),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],

                               )
                              
                             ],
                           ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            )
          ),
        );
      })
    );
  }
}
