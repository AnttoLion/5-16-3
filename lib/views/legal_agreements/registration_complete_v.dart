import 'package:extra_staff/utils/services.dart';
import 'package:extra_staff/views/list_to_upload_v.dart';
import 'package:extra_staff/views/splash_screen.dart';
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
    _blinkTimer = Timer.periodic(Duration(milliseconds: 800), (timer) {
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
    Future.delayed(Duration(milliseconds: 3500), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => V2HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(milliseconds: 400),
          child: Text(
            'Welcome to Extrastaff',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF00458D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
