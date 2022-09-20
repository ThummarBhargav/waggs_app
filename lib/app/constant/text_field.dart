import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

TextFormField getTextField({
  String? hintText,
  TextEditingController? textEditingController,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double? size = 52,
  Widget? suffix,
  int? maxLine,
  Color? fillColor,
  bool isFillColor = false,
  FormFieldValidator<String>? validator,
  String? errortext,
  TextInputType textInputType = TextInputType.text,
  bool textVisible = false,
  bool readonly = false,
  List<TextInputFormatter>? textInputFormatter,
  Callback? onTap,
  Color? borderColor,
  Function(String)? onChanged,
  Function(String)? onSubmitted,
}) {
  return TextFormField(
    controller: textEditingController,
    obscureText: textVisible,
    textInputAction: TextInputAction.next,
    keyboardType: textInputType,
    validator: validator,
    maxLines: maxLine ?? 1,
    readOnly: readonly,
    onTap: onTap,
    onChanged: onChanged,
    inputFormatters: textInputFormatter,
    onFieldSubmitted: onSubmitted,
    decoration: InputDecoration(
      fillColor: fillColor,
      filled: isFillColor,
      errorText: errortext,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      hintText: hintText,
      hintStyle: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
