import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class V2SettingsView extends StatefulWidget {
  const V2SettingsView({Key? key}) : super(key: key);

  @override
  _V2SettingsViewState createState() => _V2SettingsViewState();
}

class _V2SettingsViewState extends State<V2SettingsView> {
  bool _isLoading = false;
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 4);
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'v2_settings_view_appbar_title'.tr,
          style: MyFonts.medium(25),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'v2_settings_view_appbar_title'.tr);
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
