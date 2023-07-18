import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/v2/home_v.dart';
import 'package:extra_staff/views/v2/profile_v.dart';
import 'package:extra_staff/views/v2/notifications_v.dart';
import 'package:extra_staff/views/v2/settings_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class V2WorkView extends StatefulWidget {
  const V2WorkView({Key? key}) : super(key: key);

  @override
  _V2WorkViewState createState() => _V2WorkViewState();
}

class _V2WorkViewState extends State<V2WorkView> {
  bool isLoading = false;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 1);
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'v2_work_view_appbar_title'.tr,
          style: MyFonts.medium(25),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'v2_work_view_appbar_title'.tr);
  }

  @override
  Widget build(BuildContext context) {
    return abMainWidgetWithBottomBarLoadingOverlayScaffoldScrollView(
        context, isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomBar: abV2BottomNavigationBarA(_selectedIndex, _onItemTapped));
  }
}
