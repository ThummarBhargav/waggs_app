import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

Card productCard({
  VoidCallback? onTap,
  VoidCallback? ButtonTap,
  String? image,
  String? discount,
  String? companyName,
  String? categoryName,
  String? subCategoryName,
  String? price,
  String? discountedPrice,
  String? rating,
  String? ButtonText,
  IconData? icon,
  bool? isShipping,
}) {
  return Card(
    elevation: 2,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                width: 120,
                                height: 120,
                                alignment: Alignment.center,
                                color: Colors.white,
                                margin: EdgeInsets.only(
                                    top: 25, left: 20, right: 10),
                                child: CachedNetworkImage(
                                    imageUrl: image.toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.transparent,
                                                    BlendMode.colorBurn)),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                          color: Colors.grey[100],
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 45),
                                    height: 20,
                                    width: 70,
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
                                      child: Text(
                                        "Save ${discount} %",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                // left: 20,
                top: 5, left: 5,
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${companyName}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: Color.fromRGBO(32, 193, 244, 1)),
                  )),
            ),
            Container(
              height: 30,
              width: 180,
              margin: EdgeInsets.only(),
              child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                    child: Text(
                      "${categoryName} - ${subCategoryName} ",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    "₹${price}",
                    style: GoogleFonts.roboto(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Container(
                  child: Text(
                    "₹${discountedPrice}",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                RatingBarIndicator(
                  rating: double.parse(rating.toString()),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: (isShipping == true) ? () {} : ButtonTap,
              child: Container(
                width: 140,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (isShipping == true)
                      ? Colors.grey.shade300
                      : Color.fromRGBO(32, 193, 244, 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(icon,
                        color:
                            (isShipping == true) ? Colors.grey : Colors.white,
                        size: 18),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      ButtonText.toString(),
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color:
                            (isShipping == true) ? Colors.grey : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            (isShipping == true)
                ? Text(
                    "Not delivering in your area",
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  )
                : Container(),
            Spacer(),
          ],
        ),
      ),
    ),
  );
}
