import 'package:find_a_donor/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:find_a_donor/core/assets.dart';
import 'package:find_a_donor/core/config.dart';

class LoginRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      // allowFontScaling: true,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(30.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil().setWidth(80.0),
                  bottom: ScreenUtil().setWidth(60.0),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  '${assetsBase['logo']}logo.png',
                  height: ScreenUtil().setWidth(165.0),
                  alignment: Alignment.topCenter,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: ScreenUtil().setWidth(120.0),
                ),
                child: Text(
                  'you can donate for ones in need and request donation for blood if you need.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Theme.of(context).textTheme.body1.color),
                ),
              ),
              Column(
                children: <Widget>[
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home-page');
                    },
                    text: "LOGIN",
                    width: ScreenUtil().setWidth(240.0),
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/register-phone-page',
                      );
                    },
                    text: "REGISTER",
                    width: ScreenUtil().setWidth(240.0),
                    whiteButton: false,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(15),
                ),
                child: Text(
                  'By creating an account, you agree to the Terms of use and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Theme.of(context).textTheme.body1.color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
