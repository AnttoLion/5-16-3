import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:extra_staff/controllers/welcome_c.dart';

class WelcomeView extends StatelessWidget {
  final WelcomeController welcomeController = WelcomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              abSpacing(32),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              abSpacing(32),
              Text(
                "Basic Explanation".toUpperCase(),
                style: TextStyle(color: MyColors.grey),
              ),
              Container(
                padding: EdgeInsets.all(75),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    abSpacing(32),
                    ElevatedButton(
                      onPressed: () => welcomeController.lookingForAJob(),
                      child: Text(
                        'Looking for a job?'.toUpperCase(),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.blue,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                    abSpacing(32),
                    ElevatedButton(
                      onPressed: () => welcomeController.alreadySignedUp(),
                      child: Text(
                        'Already Signed Up?'.toUpperCase(),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.blue,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(16),
                      ),
                    ),
                    // abSpacing(32),
                    // Container(
                    //   height: 50,
                    //   child: OverflowBox(
                    //     alignment: Alignment.center,
                    //     minWidth: 100,
                    //     maxWidth: double.infinity,
                    //     minHeight: 50,
                    //     maxHeight: 100,
                    //     child: SizedBox(
                    //       width: 300,
                    //       child: Stack(
                    //         alignment: AlignmentDirectional.center,
                    //         children: [
                    //           Divider(
                    //             thickness: 3,
                    //           ),
                    //           Container(
                    //             color: MyColors.white,
                    //             padding: EdgeInsets.symmetric(horizontal: 16),
                    //             child: Text(
                    //               'Invite sent'.toUpperCase(),
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                 color: MyColors.grey,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // abSpacing(32),
                    // ElevatedButton(
                    //   onPressed: () => welcomeController.enterCode(),
                    //   child: Text(
                    //     'Enter code'.toUpperCase(),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: MyColors.blue,
                    //     shape: StadiumBorder(),
                    //     padding: EdgeInsets.all(16),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
