import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class V2ProfileMyDetailsBankDetailsView extends StatefulWidget {
  const V2ProfileMyDetailsBankDetailsView({Key? key}) : super(key: key);

  @override
  _V2ProfileMyDetailsBankDetailsViewState createState() =>
      _V2ProfileMyDetailsBankDetailsViewState();
}

class _V2ProfileMyDetailsBankDetailsViewState
    extends State<V2ProfileMyDetailsBankDetailsView> {
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
              'Profile/My Details/Bank Details',
              style: MyFonts.regular(20, color: myThemeColors.primary),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'Bank Details');
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
