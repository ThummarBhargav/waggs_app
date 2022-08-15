import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Container getcon({
   double? height,
  double? width,
  AlignmentGeometry? alignment,
  Text? text,
  Color? color,
}){
  return Container(
    width: width,
    height: height,
    alignment:alignment,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    ),
    child: text);

}



