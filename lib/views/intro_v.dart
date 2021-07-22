import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:extra_staff/controllers/login_c.dart';
import 'package:extra_staff/controllers/page_controller_c.dart';

class IntroView extends StatelessWidget {
  IntroView(this.title, this.pcc);

  final LoginController loginController = LoginController();

  final String title;
  final double circleHeight = 275;
  final PageControllerController pcc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Container(
              height: circleHeight,
              width: circleHeight,
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.blueAccent),
                borderRadius: BorderRadius.all(
                  Radius.circular(circleHeight / 2),
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/profile.png'),
              ),
            ),
            Spacer(),
            Container(
              height: 74,
              width: 74,
              decoration: BoxDecoration(
                color: MyColors.blueAccent,
                border: Border.all(color: MyColors.blueAccent),
                borderRadius: BorderRadius.all(
                  Radius.circular(37),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                color: MyColors.white,
                iconSize: 35,
                onPressed: () => pcc.onChange(),
              ),
            ),
            Text(
              'How to #$title',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Text(
                pcc.data[title]!.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
