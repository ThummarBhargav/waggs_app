import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';

class ViewProductView extends GetWidget<HomeController> {
  int index;
  ViewProductView(this.index);
  @override


  Widget build(BuildContext context) {
    int a;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // title: const Text('product View'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed:  (){}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 18),
                height: 250,
                color: Colors.grey.shade200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                         Container(
                           margin: EdgeInsets.all(5),
                           height: 25,
                           width: 50,
                           decoration: BoxDecoration(
                             color: Colors.green,
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(20),
                               topRight: Radius.circular(20),
                               bottomRight: Radius.circular(20),
                               bottomLeft: Radius.circular(20),
                             ),
                           ),
                           child: Center(
                             child: Text("NEW",
                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),),
                           ),
                         ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text("Save ${controller.productList[index].discount!.toStringAsFixed(0)} %",
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.network(width: 160,height:160,
                                  "${controller.productList[index].images![0]}"),
                          ),

                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 6.0,left: 6),
                                  child: Text("${controller.productList[index].title}" ,
                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 6.0,left: 6,top: 10),
                                  child: Text("${controller.productList[index].description}" ,maxLines: 2,overflow:TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w500,fontSize: 12),),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: RatingBarIndicator(
                                        rating: controller.productList[index].rating!.toDouble(),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                    Text(controller.productList[index].rating.toString(),style: TextStyle(fontSize: 10),),
                                    Text(" | ${controller.productList[index].ratedBy} Rating ",style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(children: [
                                    Text("\u{20B9}${controller.productList[index].discountedPrice}.00",
                                    style: TextStyle(fontSize: 12),),
                                    Text(" - \u{20B9}" ,style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    Text("${controller.productList[index].price}.00",
                                        style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 12,color: Colors.grey)),
                                  ],),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("You Save : \u{20B9}${controller.productList[index].price!-controller.productList[index].discountedPrice!}"
                                      "(${controller.productList[index].discount!.toStringAsFixed(0)}%)",
                                  style: TextStyle(color: Colors.orange,fontSize: 12),),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),

              // Container(
              //   height: 100,
              //   width: 100,
              //   child:ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: controller.productList[index].images!.length,
              //     itemBuilder: (context, index) {
              //     return Card (
              //       child: Row(
              //         children: [
              //         Image.network(width: 50,height:50,
              //                     "${controller.productList[index].images![index]}"),
              //         ],
              //       ),
              //     );
              //   },)
              // ),

            ],
          ),
        ),
      ),
    );
  }
}


//child: Column(
//           children: [
//             Text(
//               controller.productList[index].title!,
//               style: GoogleFonts.roboto(
//               fontSize: 16,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               ),
//             ),
//             ImageSlideshow(
//                 width: double.infinity,
//                 height: 400,
//                 initialPage: 0,
//                 indicatorColor: Colors.blue,
//                 indicatorBackgroundColor: Colors.grey,
//                 onPageChanged: (value) {
//                   debugPrint('Page changed: $value');
//                 },
//                 // autoPlayInterval: 3000,
//                 isLoop: false,
//                 children:[
//                   Image(image:  NetworkImage(
//                       "${controller.productList[index].images![0]}"),
//                   ),
//                   Image(image:  NetworkImage(
//                       "${controller.productList[index].images![1]}"),
//                   ),
//     ],
//             )
//           ],
//         ),