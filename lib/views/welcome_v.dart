import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/login_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    if (isWebApp) {
      return Scaffold(
        appBar: abHeaderForWeb(context, 'howCanWeHelp'.tr, showHome: false),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Container(
              padding: gHPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!ResponsiveWidget.isSmallScreen(context)) Spacer(),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 32),
                          abSimpleButton(
                            'signIn'.tr.toUpperCase(),
                            onTap: () =>
                                Get.to(() => LoginView(), arguments: true),
                          ),
                          SizedBox(height: 32),
                          abSimpleButton(
                            'signUp'.tr.toUpperCase(),
                            onTap: () =>
                                Get.to(() => LoginView(), arguments: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!ResponsiveWidget.isSmallScreen(context)) Spacer(),
                ],
              ),
            ),
            Spacer(),
            abBottomForWeb(context, top: null),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: abHeader('howCanWeHelp'.tr, showHome: false),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Container(
              padding: gHPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  abSimpleButton(
                    'signIn'.tr.toUpperCase(),
                    onTap: () => Get.to(() => LoginView(), arguments: true),
                  ),
                  SizedBox(height: 32),
                  abSimpleButton(
                    'signUp'.tr.toUpperCase(),
                    onTap: () => Get.to(() => LoginView(), arguments: true),
                  ),
                ],
              ),
            ),
            Spacer(),
            abBottom(top: null),
          ],
        ),
      );
    }
  }
}
