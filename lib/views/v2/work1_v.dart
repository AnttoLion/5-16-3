import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class V2Work1View extends StatefulWidget {
  const V2Work1View({Key? key}) : super(key: key);

  @override
  _V2Work1ViewState createState() => _V2Work1ViewState();
}

class _V2Work1ViewState extends State<V2Work1View> {
  bool _isLoading = false;
  int _selectedIndex = 1;
  bool _isCalendarVisible = false;

  List<bool> _isVisibleList = [true, true, true];

  late CalendarFormat _calendarFormat = CalendarFormat.week;
  late DateTime selectedDay = DateTime.now();

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  MyThemeColors get _myThemeColors =>
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
        padding: EdgeInsets.all(16),
        color: _myThemeColors.itemContainerBackground,
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
                  transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: MyColors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
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
    Widget thisWeeksShiftSelector = Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isCalendarVisible = !_isCalendarVisible;
              });
            },
            child: Icon(Icons.calendar_month, color: MyColors.darkBlue),
          ),
          SizedBox(width: 24),
          Text(
            'v2_this_weeks_shift_selector'.tr,
            style: MyFonts.regular(24, color: _myThemeColors.primary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      SizedBox(height: 10),
      if (_isCalendarVisible)
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: TableCalendar(
              firstDay: DateTime(DateTime.now().year - 1),
              lastDay: DateTime(DateTime.now().year + 1),
              focusedDay: _focusedDay,
              availableCalendarFormats: const {
                CalendarFormat.week: 'week',
              },
              headerVisible: false,
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
                    _isVisibleList = [true, true];
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
                _focusedDay = focusedDay;
              },
            ),
          ),
        ),
      SizedBox(height: 20),
      for (int i = 0; i < _isVisibleList.length; i++)
        getThisWeeksSelectorItemWidget(
          "2:00 PM",
          "4:00 PM",
          "Get the Lorem Ipsum Mall to the Ipsum Lorem Fabric",
          "Delivery",
        ),
    ]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 36),
          thisWeeksShiftSelector,
        ],
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'v2_work_view_appbar_title'.tr);
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
