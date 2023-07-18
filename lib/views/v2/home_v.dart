import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/v2/work_v.dart';
import 'package:extra_staff/views/v2/profile_v.dart';
import 'package:extra_staff/views/v2/notifications_v.dart';
import 'package:extra_staff/views/v2/settings_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class V2HomeView extends StatefulWidget {
  const V2HomeView({Key? key}) : super(key: key);

  @override
  _V2HomeViewState createState() => _V2HomeViewState();
}

class _V2HomeViewState extends State<V2HomeView> {
  bool isLoading = false;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Get.to(() => V2WorkView());
        break;
      case 1:
        Get.to(() => V2ProfileView());
        break;
      case 3:
        Get.to(() => V2NotificationsView());
        break;
      case 4:
        Get.to(() => V2SettingsView());
        break;
      default:
    }
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Weekly Shift',
          style: MyFonts.medium(25, color: MyColors.v2Primary),
          textAlign: TextAlign.center,
        ),
        Text(
          'Lorem lpsum sit dolor para cambre los canos ce te pas',
          style: MyFonts.medium(16, color: MyColors.grey),
          textAlign: TextAlign.left,
        )
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
    if (isWebApp) {
      return PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            padding: gHPadding,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Positioned.fill(
                  child: Row(
                    children: [
                      if (!ResponsiveWidget.isSmallScreen(context)) Spacer(),
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.home_outlined),
                            Expanded(
                              child: Text(
                                'Home',
                                style: MyFonts.medium(25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!ResponsiveWidget.isSmallScreen(context)) Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            padding: gHPadding,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.home_outlined),
                      Expanded(
                        child: Text(
                          'Home',
                          style: MyFonts.medium(25),
                          textAlign: TextAlign.center,
                        ),
                      ),
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

  @override
  Widget build(BuildContext context) {
    return abMainWidgetWithBottomBarLoadingOverlayScaffoldScrollView(
        context, isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomBar: abV2BottomNavigationBarB(_selectedIndex, _onItemTapped));
  }
}
