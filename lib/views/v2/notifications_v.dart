import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class V2NotificationsView extends StatefulWidget {
  const V2NotificationsView({Key? key}) : super(key: key);

  @override
  _V2NotificationsViewState createState() => _V2NotificationsViewState();
}

class _V2NotificationsViewState extends State<V2NotificationsView> {
  bool _isLoading = false;
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 3);
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'v2_notifications_view_appbar_title'.tr,
          style: MyFonts.medium(25),
          textAlign: TextAlign.center,
        )
      ],
    );
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
