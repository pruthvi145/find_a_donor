import 'package:find_a_donor/core/colors.dart';
import 'package:find_a_donor/core/widgets/custom_button.dart';
import 'package:find_a_donor/core/assets.dart';
import 'package:find_a_donor/features/authentication/presentation/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:find_a_donor/core/config.dart';

class RegisterOtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(20)),
                child: IconButton(
                  icon: Icon(
                    LineIcons.long_arrow_left,
                    size: ScreenUtil().setWidth(45),
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(30),
                  top: ScreenUtil().setWidth(0),
                  right: ScreenUtil().setWidth(30),
                  bottom: ScreenUtil().setWidth(50),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: ScreenUtil().setWidth(10)),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: ScreenUtil().setWidth(10),
                        top: ScreenUtil().setWidth(20),
                      ),
                      width: double.infinity,
                      child: Text(
                        "VERIFICATION",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeColors.black,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Please enter the OTP sent to ",
                        children: [
                          TextSpan(
                              text: '+91-8787878787',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                        style: TextStyle(
                          color: ThemeColors.black,
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(70)),
                    SvgPicture.asset(
                      '${assetsRegisterOtpPage['icons']}/otp_key.svg',
                      height: ScreenUtil().setWidth(200),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(80)),
                    Column(
                      children: <Widget>[
                        OtpTextField(),
                        SizedBox(height: ScreenUtil().setWidth(10)),
                        CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/done-page');
                          },
                          text: 'VERIFY AND PROCEED',
                          whiteButton: false,
                        ),
                        SizedBox(height: ScreenUtil().setWidth(5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Don\'t receive the OTP?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
