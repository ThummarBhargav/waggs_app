import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Card shopCard({
  VoidCallback? onTap,
  String? image,
  String? companyName,
  String? address,
  String? ButtonText,
}){
  return Card(
    elevation: 2,
    child: GestureDetector(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    alignment: Alignment.center,
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10),
                    child: CachedNetworkImage(
                        imageUrl:
                        image.toString(),
                        imageBuilder: (context,
                            imageProvider) =>
                            Container(
                              decoration:
                              BoxDecoration(
                                image: DecorationImage(
                                    image:
                                    imageProvider,
                                    fit: BoxFit
                                        .cover,
                                    colorFilter: ColorFilter
                                        .mode(
                                        Colors
                                            .transparent,
                                        BlendMode
                                            .colorBurn)),
                              ),
                            ),
                        placeholder: (context,
                            url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context,
                            url, error) =>
                            Container(
                              color: Colors
                                  .grey[100],
                            )),
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
                child: companyName ==
                    null
                    ? Container(
                  child: Text(
                    "N/A",
                    style: TextStyle(
                        fontWeight:
                        FontWeight.bold,
                        color:
                        Color.fromRGBO(
                            32,
                            193,
                            244,
                            1)),
                  ),
                )
                    : Text(
                  companyName,
                  style:
                  GoogleFonts.raleway(
                      fontWeight:
                      FontWeight
                          .w700,
                      fontSize: 13,
                      color: Color
                          .fromRGBO(
                          32,
                          193,
                          244,
                          1)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 5, right: 5),
              height: 40,
              width: 200,
              child: Align(
                  alignment: Alignment.center,
                  child: address ==
                      null
                      ? Text(
                    "N/A",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey),
                  )
                      : Text(
                    "${address}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey),
                    textAlign:
                    TextAlign.center,
                  )),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                width: 130,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                      32, 193, 244, 1),
                  borderRadius: BorderRadius
                      .only(
                    topRight: Radius.circular(
                        25),
                    bottomRight:
                    Radius.circular(25),
                    bottomLeft:
                    Radius.circular(25),
                  ),
                ),
                child: Text(
                  "${ButtonText}",
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
}