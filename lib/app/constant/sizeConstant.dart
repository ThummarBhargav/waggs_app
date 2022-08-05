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

