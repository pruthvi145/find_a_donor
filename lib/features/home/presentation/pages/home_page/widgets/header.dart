import 'package:find_a_donor/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  Widget _buildHeaderInfoWidget({
    @required BuildContext context,
    @required String text1,
    @required String text2,
    @required SvgPicture customSvgIcon,
  }) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              text1,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 10
            ),
            customSvgIcon,
          ],
        ),
        Text(
          text2,
          style: Theme.of(context).primaryTextTheme.body2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "${assetsHomePage['images']}bg/background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: <Widget>[
              Text(
                "GIVE THE GIFT OF LIFE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    " DONATE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    " BLOOD ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                      backgroundColor: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildHeaderInfoWidget(
                    context: context,
                    text1: "157",
                    text2: "New blood requests",
                    customSvgIcon: SvgPicture.asset(
                      '${assetsHomePage['icons']}header/drops-icon.svg',
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 1.0,
                    color: Colors.white,
                  ),
                  _buildHeaderInfoWidget(
                    context: context,
                    text1: "45",
                    text2: "Avalible Donors",
                    customSvgIcon: SvgPicture.asset(
                      '${assetsHomePage['icons']}header/donors-icon.svg',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
