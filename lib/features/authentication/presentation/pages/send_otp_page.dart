import 'dart:convert';

import 'package:find_a_donor/core/colors.dart';
import 'package:find_a_donor/core/widgets/custom_button.dart';
import 'package:find_a_donor/core/assets.dart';
import 'package:find_a_donor/features/authentication/presentation/widgets/custom_phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:find_a_donor/core/config.dart';
import 'package:http/http.dart' as http;

class SendOtpPage extends StatefulWidget {
  final String title;

  SendOtpPage({Key key, this.title});
  @override
  _SendOtpPageState createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");
  TextEditingController phoneController = TextEditingController();
  final sendOtpScaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    );
    return Scaffold(
      key: sendOtpScaffoldKey,
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
                        top: ScreenUtil().setWidth(20),
                      ),
                      width: double.infinity,
                      child: Text(
                        "CREATE ACCOUNT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeColors.black,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(70)),
                    SvgPicture.asset(
                      '${assetsRegisterPhonePage['icons']}/mobile_girl.svg',
                      height: ScreenUtil().setWidth(216),
                    ),
                    SizedBox(height: ScreenUtil().setWidth(90)),
                    Column(
                      children: <Widget>[
                        CustomPhoneTextField(
                          countryCodeController: countryCodeController,
                          phoneController: phoneController,
                        ),
                        SizedBox(height: ScreenUtil().setWidth(10)),
                        isLoading
                            ? CircularProgressIndicator()
                            : CustomButton(
                                onPressed: () {
                                  if (!isPhone(phoneController.text)) {
                                    return showError("Invalid phone number!");
                                  }
                                  sendCode(phoneController.text);
                                  // Navigator.pushNamed(context, '/register-otp-page');
                                },
                                text: 'GET OTP',
                                whiteButton: false,
                              ),
                        SizedBox(height: ScreenUtil().setWidth(5)),
                        Text(
                          'We will send One Time Password to your phone number via SMS.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w500,
                          ),
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

  bool isPhone(String phone) {
    return phone.length == 10;
  }

  void showError(String message) {
    sendOtpScaffoldKey.currentState.removeCurrentSnackBar();
    sendOtpScaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    ));
  }

  void sendCode(String phone) async {
    const url = "http://fd97fc15.ngrok.io/api/v1/auth/sendcode";
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(url,
          body: jsonEncode({"phone": "$phone"}),
          headers: {"Content-type": "application/json"});
      if (response.statusCode != 200) {
        showError(jsonDecode(response.body)["errors"][0]["msg"]);
      } else if (jsonDecode(response.body)["success"] == false) {
        throw jsonDecode(response.body)["errors"][0]["msg"];
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
}
