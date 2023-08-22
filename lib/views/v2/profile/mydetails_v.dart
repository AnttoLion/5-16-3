import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/v2/profile/mydetails_NI_v.dart';
import 'package:extra_staff/views/v2/profile/mydetails_bankdetails_v.dart';
import 'package:extra_staff/views/v2/profile/mydetails_details_v.dart';
import 'package:extra_staff/views/v2/profile/mydetails_license_v.dart';
import 'package:extra_staff/views/v2/profile/mydetails_rtw_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/theme.dart';
import 'mydetails_mydetails_v.dart';

class V2ProfileMyDetailsView extends StatefulWidget {
  const V2ProfileMyDetailsView({Key? key}) : super(key: key);

  @override
  _V2ProfileMyDetailsViewState createState() => _V2ProfileMyDetailsViewState();
}

class _V2ProfileMyDetailsViewState extends State<V2ProfileMyDetailsView> {
  MyThemeColors get _myThemeColors =>
      Theme.of(context).extension<MyThemeColors>()!;
  bool _isLoading = false;
  int _selectedIndex = 2;
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime selectedDay = DateTime.now();
  double opacityLevel = 1.0;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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
          abV2PrimaryButton(
            'MY DETAILS',
            onTap: () => {Get.to(() => V2ProfileMyDetailsMyDetailsView())},
            fullWidth: true,
          ),
          SizedBox(height: 20),
          abV2PrimaryButton(
            'BANK DETAILS',
            onTap: () => {Get.to(() => V2ProfileMyDetailsBankDetailsView())},
            fullWidth: true,
          ),
          SizedBox(height: 20),
          abV2PrimaryButton(
            'LICENSES',
            onTap: () => {Get.to(() => V2ProfileLicenseView())},
            fullWidth: true,
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'History',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF00458D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime(DateTime.now().year - 1),
                lastDay: DateTime(DateTime.now().year + 1),
                focusedDay: _focusedDay,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                headerStyle: HeaderStyle(titleCentered: true),
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              //borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  //spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            // color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company name:',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            ' Lorem Ipsum sitorol',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date:',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '22.June.2023',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'My Details');
  }

  @override
  Widget build(BuildContext context) {
    return abV2MainWidgetWithLoadingOverlayScaffoldScrollView(
      context,
      _isLoading,
      appBar: getAppBar(),
      content: getContent(),
      bottomNavigationBar:
          abV2BottomNavigationBarA(_selectedIndex, _onItemTapped),
    );
  }
}
