import 'package:flutter/material.dart';
import 'package:find_a_donor/core/colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool enabled;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Function(String) onChanged;
  final int maxLength;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final bool autofocus;
  CustomTextField({
    Key key,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.onChanged,
    this.keyboardType,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: Color(0x29000000),
            blurRadius: 6,
          ),
        ],
      ),
      child: TextField(
        autofocus: autofocus,
        focusNode: focusNode,
        onChanged: onChanged,
        maxLength: maxLength,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          color: ThemeColors.black,
          fontWeight: fontWeight,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10),
            vertical: ScreenUtil().setWidth(17),
          ),
          hintText: this.hintText,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
