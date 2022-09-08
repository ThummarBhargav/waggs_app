import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}

getSnackBar(
    {required BuildContext context, String text = "", int duration = 500}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), duration: Duration(milliseconds: duration)),
  );
}

CachedNetworkImage getImageByLink(
    {required String url,
    required double height,
    required double width,
    bool isLoading = false,
    bool colorFilter = false,
    BoxFit boxFit = BoxFit.contain}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: boxFit,
          colorFilter: (colorFilter)
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken)
              : null,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: 30,
      width: 30,
      child: LinearProgressIndicator(
        color: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade100,
      ),
    ),
    errorWidget: (context, url, error) =>
        Image(image: AssetImage("assets/logo111.png")),
  );
}
