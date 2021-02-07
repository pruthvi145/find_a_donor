import 'package:find_a_donor/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeActionButtons extends StatelessWidget {
  Widget _buildActionButtonChild({
    @required String text,
    @required SvgPicture customSvgImage,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        customSvgImage,
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    @required BuildContext context,
    @required Function onPressed,
    @required String text,
    @required String imageAssetName,
  }) {
    return RaisedButton(
      splashColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColorLight,
      color: Colors.white,
      onPressed: onPressed,
      child: _buildActionButtonChild(
        text: text,
        customSvgImage: SvgPicture.asset(
          imageAssetName,
          height: 60,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.all(20),
      primary: false,
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: <Widget>[
        _buildActionButton(
          context: context,
          onPressed: () {},
          text: "FIND A DONOR",
          imageAssetName:
              '${assetsHomePage['icons']}action-buttons/find-a-donor-icon.svg',
        ),
        _buildActionButton(
          context: context,
          onPressed: () {},
          text: "BLOOD BANKS",
          imageAssetName:
              '${assetsHomePage['icons']}action-buttons/blood-bank-icon.svg',
        ),
        _buildActionButton(
          context: context,
          onPressed: () {},
          text: "REQUESTS",
          imageAssetName:
              '${assetsHomePage['icons']}action-buttons/requests-icon.svg',
        ),
        _buildActionButton(
          context: context,
          onPressed: () {
            Navigator.pushNamed(context, '/reset-password-phone-page');
          },
          text: "OTHERS",
          imageAssetName:
              '${assetsHomePage['icons']}action-buttons/others-icon.svg',
        ),
      ],
    );
  }
}
