import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class V2ProfileView extends StatefulWidget {
  const V2ProfileView({Key? key}) : super(key: key);

  @override
  _V2ProfileViewState createState() => _V2ProfileViewState();
}

class _V2ProfileViewState extends State<V2ProfileView> {
  bool isLoading = false;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 2);
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'v2_profile_view_appbar_title'.tr,
          style: MyFonts.medium(25),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'v2_profile_view_appbar_title'.tr);
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
