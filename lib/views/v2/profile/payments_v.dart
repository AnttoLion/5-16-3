import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class V2ProfilePaymentsView extends StatefulWidget {
  const V2ProfilePaymentsView({Key? key}) : super(key: key);

  @override
  _V2ProfilePaymentsViewState createState() => _V2ProfilePaymentsViewState();
}

class _V2ProfilePaymentsViewState extends State<V2ProfilePaymentsView> {
  MyThemeColors get myThemeColors =>
      Theme.of(context).extension<MyThemeColors>()!;
  bool isLoading = false;
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
              'Profile/Payments',
              style: MyFonts.regular(20, color: myThemeColors.primary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(children: [
              Expanded(
                  child: abV2PrimaryButton('v2_download_as_a_pdf'.tr,
                      onTap: () => {}, fullWidth: true)),
              SizedBox(width: 10),
              Expanded(
                  child: abV2PrimaryButton('v2_send_to_email'.tr,
                      onTap: () => {}, fullWidth: true)),
            ]),
            SizedBox(height: 24),
            abV2PrimaryButton('v2_button_text_paye_history'.tr,
                onTap: () => {}, fullWidth: true),
            SizedBox(height: 24),
            abV2PrimaryButton('v2_button_text_paye_documents'.tr,
                onTap: () => {}, fullWidth: true),
          ],
        ));
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'v2_profile_payments_view_appbar_title'.tr);
  }

  @override
  Widget build(BuildContext context) {
    return abV2MainWidgetWithLoadingOverlayScaffoldScrollView(
        context, isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomNavigationBar:
            abV2BottomNavigationBarA(_selectedIndex, _onItemTapped));
  }
}
