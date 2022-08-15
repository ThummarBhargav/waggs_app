import 'dart:convert';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/modules/home/controllers/home_controller.dart';

import '../../../Modal/TopSellingStore.dart';

class ViewProductView extends GetWidget<HomeController> {
  Products0 data;

  var dropdownItems;
  ViewProductView(this.data);
  @override
  CarouselController carouselController = CarouselController();


  Widget build(BuildContext context) {
   int  _count=0;
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
                              child: Text("Save ${data.discount!.toStringAsFixed(0)} %",
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
                                  "${data.images![0]}"),
                          ),

                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 6.0,left: 6),
                                  child: Text("${data.title}" ,
                            style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,fontSize: 16),),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 6.0,left: 6,top: 10),
                                  child: Text("${data.description}" ,maxLines: 2,overflow:TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w500,fontSize: 12),),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: RatingBarIndicator(
                                        rating: data.rating!.toDouble(),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                    Text(data.rating.toString(),style: TextStyle(fontSize: 10),),
                                    Text(" | ${data.ratedBy} Rating ",style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(children: [
                                    Text("\u{20B9}${data.discountedPrice}.00",
                                    style: TextStyle(fontSize: 12),),
                                    Text(" - \u{20B9}" ,style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    Text("${data.price}.00",
                                        style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 12,color: Colors.grey)),
                                  ],),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("You Save : \u{20B9}${data.price!-data.discountedPrice!}"
                                      "(${data.discount!.toStringAsFixed(0)}%)",
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
        //     width: 350,
        //     height: 110,
        //     child: Stack(
        //       children: [
        //         CarouselSlider(
        //           carouselController: carouselController, //// Give the controller
        //           options: CarouselOptions(
        //             height: 200,
        //             autoPlay: false,
        //           ),
        //           items:  List.generate( data.images!.length,(index){
        //             return Container (
        //               color: Colors.grey.shade300,
        //                        child: Padding(
        //                          padding: const EdgeInsets.all(8.0),
        //                          child: Image.network(width: 100,height:100,
        //                                       "${data.images![index]}"),
        //                        ),
        //                       );
        //           }),
        //     ),
        //         Padding(
        //           padding: const EdgeInsets.only(top: 8.0,right: 10),
        //           child: Align(
        //             alignment: Alignment.centerLeft,
        //             child: IconButton(
        //               onPressed: () {
        //                 // Use the controller to change the current page
        //                 carouselController.previousPage();
        //               },
        //               icon: Icon(Icons.arrow_back),
        //             ),
        //           ),
        //         ),
        //         Align(
        //           alignment: Alignment.centerRight,
        //           child: IconButton(
        //             onPressed: () {
        //               // Use the controller to change the current page
        //               carouselController.nextPage();
        //             },
        //             icon: Icon(Icons.arrow_forward),
        //           ),
        //         ),
        //       ],
        //
        //     ),
        //   ),
              Container(
                width: 350,
                height: 110,
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                      carouselController: carouselController,
                      itemCount: data.images!.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 100,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                      ),
                      itemBuilder: (context, index, id){
                        //for onTap to redirect to another screen
                        return GestureDetector(
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(width: 100,height:100,
                                                           "${data.images![index]}"),
                            ),
                          ),
                          onTap: () {
                            var url = data.images![index];
                            print(url.toString());
                          }
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0,right: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            // Use the controller to change the current page
                            carouselController.previousPage();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          // Use the controller to change the current page
                          carouselController.nextPage();
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),

              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                    child: Text("Quantity",style: TextStyle(fontSize: 20,color: Colors.lightBlue.shade300,fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 15),
                  width: MediaQuery.of(context).size.width*0.4,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 2,
                ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            if(_count>0){
                              _count--;
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 5),
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 22,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8),
                        child: Container(
                          height: 75,
                          width: 75,
                          padding:
                          EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide( //                   <--- left side
                                color: Colors.grey,
                                width: 2.0,
                              ),
                              right: BorderSide( //                    <--- top side
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            ),
                          child: Center(
                            child: Text(
                              "${_count}",
                              style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            _count++;
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 22,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 15),
                    child: getcon(
                      text:Text("ADD TO CART",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color:Colors.white),
                      ),
                      color: Color(0xffDE8701),
                      width: 140,
                      height: 50,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,top: 15),
                    child: getcon(
                      text:Text("BUY NOW",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color:Colors.white),
                      ),
                      color: Colors.black,
                      width: 120,
                      height: 50,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 6,top: 8),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      border: Border.all(
                        color: Colors.lightBlue.shade300,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border,size: 15,color: Colors.blue.shade300,),
                      onPressed:(){},

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5,right: 6,top: 8),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      border: Border.all(
                        color: Colors.lightBlue.shade300,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.share_outlined,size: 17,color: Colors.blue.shade300,),
                        onPressed:(){},

                      ),
                    ),
                  )
                ],
              ),
        InkWell(
          onTap: (){

          },
          child: Container(
            margin: EdgeInsets.all(18),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xffDE8701),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  Text("key Featchers",style: TextStyle(
                    color: Colors.white,fontSize: 15
                  ),),SizedBox(width: 210,),
                  Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
                ],
              ),),
        ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.all(18),
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffDE8701),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text("Seller Details",style: TextStyle(
                          color: Colors.white,fontSize: 15
                      ),),SizedBox(width: 210,),
                      Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
                    ],
                  ),),
              ),

               Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                        decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffDE8701), width: 2),
                        borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                        borderSide: BorderSide(color:  Color(0xffDE8701), width: 2),
                        borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor:  Color(0xffDE8701),
                        ),
                        value: null,
                        items: <DropdownMenuItem<int>>[
                          new DropdownMenuItem(
                            child: new Text('Foo'),
                            value: 0,
                          ),
                          new DropdownMenuItem(
                            child: new Text('Bar'),
                            value: 42,
                          ),
                        ],
                        onChanged: null,
                        ),
)

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



//drop down
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: DropdownButtonFormField(
// decoration: InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xffDE8701), width: 2),
// borderRadius: BorderRadius.circular(20),
// ),
// border: OutlineInputBorder(
// borderSide: BorderSide(color:  Color(0xffDE8701), width: 2),
// borderRadius: BorderRadius.circular(20),
// ),
// filled: true,
// fillColor:  Color(0xffDE8701),
// ),
// value: null,
// items: dropdownItems,
// onChanged: null,
// ),
// )