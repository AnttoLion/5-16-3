import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/utils/theme.dart';
import 'package:extra_staff/views/v2/home_v.dart';
import 'package:extra_staff/views/v2/profile_v.dart';
import 'package:extra_staff/views/v2/notifications_v.dart';
import 'package:extra_staff/views/v2/settings_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class V2WorkView extends StatefulWidget {
  const V2WorkView({Key? key}) : super(key: key);

  @override
  _V2WorkViewState createState() => _V2WorkViewState();
}

class _V2WorkViewState extends State<V2WorkView> {
  bool isLoading = false;
  int _selectedIndex = 1;
  MyThemeColors get myThemeColors =>
      Theme.of(context).extension<MyThemeColors>()!;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 1);
  }

  Widget getThisWeeksSelectorItemWidget(
      String startTime, String endTime, String title, String type) {
    return Container(
        height: 100,
        width: 300,
        // width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: myThemeColors.itemContainerBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(startTime,
                    style: MyFonts.regular(16, color: MyColors.grey)),
                Container(
                  width: 24,
                  height: 24,
                  // Negative padding
                  transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                  // Add top border
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: MyColors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                // ConstrainedBox(
                //   constraints: BoxConstraints(minWidth: 20),
                //   child: Divider(
                //     height: 24,
                //     thickness: 12,
                //     color: MyColors.black,
                //   ),
                // ),
                Text(endTime, style: MyFonts.regular(16, color: MyColors.grey))
              ],
            ),
            SizedBox(width: 32),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: MyFonts.regular(14),
                ),
                Expanded(child: SizedBox(height: 14)),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(type,
                        style: MyFonts.regular(12, color: MyColors.grey)),
                  ],
                )
              ],
            ))
          ],
        ));
  }

  Widget getContent() {
    Widget mapToJob = Column(children: [
      Column(
        children: [
          SizedBox(height: 12),
          Container(
            height: 200,
            width: double.infinity,
            color: MyColors.grey,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(51.509364, -0.128928),
                zoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
              height: 88,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: myThemeColors.itemContainerBackground,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text("Get more infos for yout Active/Today's shift...",
                          style: MyFonts.regular(16)),
                    ],
                  )),
                  SizedBox(width: 60),
                  SvgPicture.asset("lib/images/v2/phone.svg",
                      width: 48, height: 48),
                ],
              ))
        ],
      )
    ]);

    Widget thisWeeksShiftSelector = Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.calendar_month, color: MyColors.darkBlue),
        SizedBox(width: 24),
        Text(
          'v2_this_weeks_shift_selector'.tr,
          style: MyFonts.regular(24, color: myThemeColors.primary),
          textAlign: TextAlign.center,
        ),
      ]),
      SizedBox(height: 40),
      RichText(
        text: TextSpan(
          style: MyFonts.regular(18, color: MyColors.grey),
          children: <TextSpan>[
            TextSpan(
                text: 'Tomorrow ',
                style: TextStyle(color: myThemeColors.primary)),
            TextSpan(text: 'Saturday, June 22, 2023'),
          ],
        ),
      ),
      SizedBox(height: 28),
      getThisWeeksSelectorItemWidget("2:00 PM", "4:00 PM",
          "Get the Lorem Ipsum Mall to the Ipsum Lorem Fabric", "Delivery"),
      SizedBox(height: 12),
      getThisWeeksSelectorItemWidget("5:00 PM", "8:00 PM",
          "Unload the cargo at the next location", "Work"),
    ]);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [mapToJob, SizedBox(height: 36), thisWeeksShiftSelector],
        ));
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'v2_work_view_appbar_title'.tr);
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
