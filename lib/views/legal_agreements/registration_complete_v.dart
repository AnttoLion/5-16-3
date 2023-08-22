import 'package:extra_staff/utils/services.dart';
import 'package:extra_staff/views/list_to_upload_v.dart';
import 'package:extra_staff/views/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/legal_agreements/hmrc_checklist_start_v.dart';
import 'package:extra_staff/views/registration_v.dart';
import 'package:extra_staff/utils/resume_navigation.dart';
import 'package:extra_staff/views/page_controller_v.dart';
import 'package:extra_staff/views/v2/home_v.dart';

import 'package:flutter/material.dart';
import 'dart:async';

class RegistrationComplete extends StatefulWidget {
  const RegistrationComplete({Key? key}) : super(key: key);

  @override
  _RegistrationCompleteState createState() => _RegistrationCompleteState();
}

class _RegistrationCompleteState extends State<RegistrationComplete> {
  double opacityLevel = 1.0;
  Timer? _blinkTimer;

  @override
  void initState() {
    super.initState();
    saveProcess();
    navigateToNextPage();

    // Start the effect
    _blinkTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        opacityLevel = opacityLevel == 1.0 ? 0.0 : 1.0;
      });
    });
  }

  @override
  void dispose() {
    _blinkTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  saveProcess() async {
    await localStorage?.setBool('isAgreementsCompleted', true);
    final result = await Services.shared.getTempProgressInfo();
    if (result.errorMessage.isNotEmpty) {
      abShowMessage(result.errorMessage);
    } else {
      await localStorage?.setString('completed', result.result['completed']);
      await Services.shared.setData();
    }
  }

  navigateToNextPage() {
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => V2HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 89,
            left: -51,
            width: 102,
            height: 89,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: MyColors.v2Primary),
              ),
            ),
          ),
          Positioned(
            top: 74,
            right: 69,
            width: 47,
            height: 37,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: MyColors.v2Primary),
              ),
            ),
          ),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // AnimatedOpacity(
              //   opacity: opacityLevel,
              //   duration: Duration(milliseconds: 280),
              //   child: Text(
              //     'Welcome to',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: MyColors.v2Primary,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // AnimatedOpacity(
              //   opacity: opacityLevel,
              //   duration: Duration(milliseconds: 240),
              //   child: Text(
              //     'Extrastaff',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: MyColors.v2Primary,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Text(
                'Welcome to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: MyColors.v2Primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Extrastaff',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: MyColors.v2Primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          Positioned(
            left: 62,
            bottom: 204,
            width: 36,
            height: 38,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: MyColors.v2Primary),
              ),
            ),
          ),
          Positioned(
            left: -18,
            bottom: -19,
            width: 36,
            height: 38,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: MyColors.v2Primary),
              ),
            ),
          ),
          Positioned(
            right: -133,
            bottom: 31,
            width: 236,
            height: 203,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: MyColors.v2Primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
