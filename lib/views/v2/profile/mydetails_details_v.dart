import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class V2ProfileMyDetailsSubDetailsView extends StatefulWidget {
  const V2ProfileMyDetailsSubDetailsView({Key? key}) : super(key: key);

  @override
  _V2ProfileMyDetailsSubDetailsViewState createState() => _V2ProfileMyDetailsSubDetailsViewState();
}

class _V2ProfileMyDetailsSubDetailsViewState extends State<V2ProfileMyDetailsSubDetailsView> {
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
              'Profile/My Details/Details',
              style: MyFonts.regular(20, color: myThemeColors.primary),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'Details');
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
