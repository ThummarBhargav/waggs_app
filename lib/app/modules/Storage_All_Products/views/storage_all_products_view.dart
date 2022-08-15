import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/Modal/TopSellingStore.dart';
import '../controllers/storage_all_products_controller.dart';
class StorageAllProductsView extends GetView<StorageAllProductsController> {
  RxList<Sellers> SellersList;
  StorageAllProductsView({required this.SellersList});
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_back)),
                Text(
                  "TOP SELLING STORES",
                  style: GoogleFonts.roboto(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: GridView.builder(
                  itemCount: SellersList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180,
                                      height: 130,
                                      alignment: Alignment.center,
                                      color: Colors.white,
                                      margin: EdgeInsets.only(
                                          top: 25, left: 10, right: 10),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                          "${SellersList[index].logoUrl}",
                                          imageBuilder: (context,
                                              imageProvider) =>
                                              Container(
                                                decoration:
                                                BoxDecoration(
                                                  image: DecorationImage(
                                                      image:
                                                      imageProvider,
                                                      fit: BoxFit.cover,
                                                      colorFilter:
                                                      ColorFilter.mode(
                                                          Colors
                                                              .transparent,
                                                          BlendMode
                                                              .colorBurn)),
                                                ),
                                              ),
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url,
                                              error) =>
                                              Expanded(
                                                  child: Container(
                                                    color: Colors.grey[100],
                                                  ))),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 150,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${SellersList[index].companyName}",
                                    style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Color.fromRGBO(
                                            32, 193, 244, 1)),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                EdgeInsets.only(left: 5, right: 5),
                                height: 40,
                                width: 200,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${SellersList[index].address}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 130,
                                  height: 35,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                    ),
                                  ),
                                  child: Text(
                                    "SHOP NOW",
                                    style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.65)),
            ),
          ],
        ),

      ),
    );
  }
}
