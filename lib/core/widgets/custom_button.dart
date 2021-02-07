import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool whiteButton;
  final double height;
  final double width;
  final Function onPressed;
  final String text;
  const CustomButton({
    Key key,
    this.width,
    this.height,
    @required this.onPressed,
    @required this.text,
    this.whiteButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            // offset: Offset.fromDirection(360, 3),
            offset: Offset(0, 3),
            color: whiteButton ? Color(0x29000000) : Color(0xB3FF7275),
            blurRadius: whiteButton ? 6 : 10,
          )
        ],
      ),
      child: MaterialButton(
        minWidth: width ?? double.infinity,
        height: height ?? ScreenUtil().setWidth(50),
        onPressed: onPressed,
        padding: EdgeInsets.all(0),
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        splashColor: whiteButton ? theme.splashColor : theme.accentColor,
        highlightColor: whiteButton ? Colors.white60 : Colors.white10,
        textColor: whiteButton ? theme.primaryColor : Colors.white,
        color: whiteButton ? Colors.white : theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
