import 'package:find_a_donor/core/assets.dart';
import 'package:find_a_donor/core/config.dart';
import 'package:find_a_donor/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              '${assetsDonePage['icons']}/checked.svg',
              height: ScreenUtil().setWidth(190),
            ),
            SizedBox(height: ScreenUtil().setWidth(35)),
            Text(
              'DONE!',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: ScreenUtil().setWidth(15)),
            Text(
              'Your information is successfully saved 😄',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setWidth(60),
                right: ScreenUtil().setWidth(30),
                left: ScreenUtil().setWidth(30),
                bottom: ScreenUtil().setWidth(5),
              ),
              child: CustomButton(
                onPressed: () {},
                text: 'VERIFY AS A DONOR',
                whiteButton: false,
                width: double.infinity,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'CONTINUE TO THE APP',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
