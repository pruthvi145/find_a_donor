import 'package:device_preview/device_preview.dart';
import 'package:find_a_donor/core/colors.dart';
import 'package:find_a_donor/features/authentication/presentation/pages/send_otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/authentication/presentation/pages/done_page.dart';
import 'features/authentication/presentation/pages/register_otp_page.dart';
import 'features/authentication/presentation/pages/reset_password_page.dart';
import 'features/authentication/presentation/pages/reset_password_phone_page.dart';
import 'features/home/presentation/pages/home_page/home_page.dart';
import 'features/authentication/presentation/pages/login_register_page.dart';

// void main() =>
//     runApp(DevicePreview(builder: (BuildContext context) => MyApp()));
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // will not rotate the phone, from services.dart
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      // locale: DevicePreview.of(context).locale,
      title: "Find a donor",
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        primaryColor: ThemeColors.primaryColor,
        accentColor: ThemeColors.accentColor,
        primaryColorLight: ThemeColors.primaryColorLight,
        primaryColorDark: ThemeColors.primaryColorDark,
        primaryTextTheme: TextTheme(
          //Black Heading Texting
          body1: TextStyle(
            color: ThemeColors.black,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFFF7F6FA),
      ),
      routes: {
        '/': (BuildContext context) => Home(),
        '/home-page': (BuildContext context) => HomePage(),
        '/login-register-page': (BuildContext context) => LoginRegisterPage(),
        '/register-phone-page': (BuildContext context) => SendOtpPage(),
        '/register-otp-page': (BuildContext context) => RegisterOtpPage(),
        '/done-page': (BuildContext context) => DonePage(),
        '/reset-password-phone-page': (BuildContext context) =>
            ResetPasswordPhonePage(),
        '/reset-password-page': (BuildContext context) => ResetPasswordPage(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginRegisterPage();
  }
}
