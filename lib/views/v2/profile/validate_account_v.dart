import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class V2ProfileValidateAccountView extends StatefulWidget {
  const V2ProfileValidateAccountView({Key? key}) : super(key: key);

  @override
  _V2ProfileValidateAccountViewState createState() =>
      _V2ProfileValidateAccountViewState();
}

class _V2ProfileValidateAccountViewState
    extends State<V2ProfileValidateAccountView> {
  MyThemeColors get _myThemeColors =>
      Theme.of(context).extension<MyThemeColors>()!;
  bool _isLoading = false;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 2);
  }

  Widget getContent() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              'v2_validate_account'.tr,
              style: MyFonts.regular(23, color: _myThemeColors.primary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SvgPicture.asset("lib/images/v2/authorization.svg",
                width: 60, height: 60),
            SizedBox(height: 30),
            Row(children: [
              Text(
                'v2_confirm_that_its_you'.tr,
                style: MyFonts.medium(19),
                textAlign: TextAlign.left,
              )
            ]),
            Row(children: [
              Text(
                'v2_please_enter_your_password_to_validate_account'.tr,
                style: MyFonts.regular(13, color: MyColors.grey),
                textAlign: TextAlign.left,
              )
            ]),
            SizedBox(height: 32),
            Row(children: [
              Text(
                'v2_reenter_your_password'.tr,
                style: MyFonts.medium(19),
                textAlign: TextAlign.left,
              )
            ]),
            Row(children: [
              Expanded(
                  child: TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          // border: OutlineInputBorder(),
                          hintText: '**************')))
            ]),
            Row(children: [
              Text(
                'v2_forget_your_password'.tr,
                style: MyFonts.regular(13, color: MyColors.v2Green),
                textAlign: TextAlign.left,
              )
            ]),
            SizedBox(height: 32),
            Row(children: [
              Expanded(
                  child: abV2PrimaryButton('v2_button_text_cancel'.tr,
                      onTap: () => {}, fullWidth: true)),
              SizedBox(width: 10),
              Expanded(
                  child: abV2PrimaryButton('v2_button_text_authorize'.tr,
                      onTap: () => {}, fullWidth: true, success: true)),
            ])
          ],
        ));
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, '');
  }

  @override
  Widget build(BuildContext context) {
    return abV2MainWidgetWithLoadingOverlayScaffoldScrollView(
        context, _isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomNavigationBar:
            abV2BottomNavigationBarA(_selectedIndex, _onItemTapped));
  }
}
