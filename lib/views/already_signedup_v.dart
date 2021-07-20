import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:extra_staff/utils/ab.dart';
import 'package:get/get.dart';

import 'link_account_v.dart';

class AlreadySignedUp extends StatelessWidget {
  const AlreadySignedUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: abPreferredSize(''),
      backgroundColor: MyColors.blue,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: MyColors.blue,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              Center(
                widthFactor: 1,
                heightFactor: 4,
                child: Text(
                  "Login.",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.to(LinkAccountView()),
                    child: Text(
                      'Email'.toUpperCase(),
                      style: TextStyle(color: MyColors.blue),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.white,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
