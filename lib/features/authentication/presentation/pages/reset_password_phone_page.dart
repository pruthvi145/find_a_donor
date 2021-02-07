import 'package:find_a_donor/core/assets.dart';
import 'package:find_a_donor/core/widgets/custom_button.dart';
import 'package:find_a_donor/features/authentication/presentation/widgets/custom_phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

class ResetPasswordPhonePage extends StatefulWidget {
  @override
  _ResetPasswordPhonePageState createState() => _ResetPasswordPhonePageState();
}

class _ResetPasswordPhonePageState extends State<ResetPasswordPhonePage> {
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(25)),
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: ScreenUtil().setWidth(80)),
                        Text(
                          "RESET PASSWORD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(25),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setWidth(60)),
                        SvgPicture.asset(
                          '${assetsResetPasswordPhonePage['icons']}/password.svg',
                          height: ScreenUtil().setWidth(190),
                        ),
                        SizedBox(height: ScreenUtil().setWidth(70)),
                        CustomPhoneTextField(
                          countryCodeController: countryCodeController,
                          phoneController: phoneController,
                        ),
                        SizedBox(height: ScreenUtil().setWidth(10)),
                        CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/reset-password-page');
                          },
                          text: 'GET OTP',
                          whiteButton: false,
                        ),
                        SizedBox(height: ScreenUtil().setWidth(50))
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
