import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:find_a_donor/core/assets.dart';

import './widgets/action_buttons.dart';
import './widgets/header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: <Widget>[
          HomeHeader(),
          SizedBox(
            height: 20,
          ),
          HomeActionButtons(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // elevation: 2.0,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: IconButton(
                splashColor: Theme.of(context).accentColor,
                highlightColor: Theme.of(context).primaryColorLight,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "${assetsHomePage['icons']}bottom-navigation/menu-icon.svg",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: IconButton(
                splashColor: Theme.of(context).accentColor,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "${assetsHomePage['icons']}bottom-navigation/search-icon.svg",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: IconButton(
                splashColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: SvgPicture.asset(
                  "${assetsHomePage['icons']}bottom-navigation/user-icon.svg",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: IconButton(
                splashColor: Theme.of(context).accentColor,
                onPressed: () {},
                icon: SvgPicture.asset(
                  "${assetsHomePage['icons']}bottom-navigation/notification-icon.svg",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
