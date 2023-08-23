import 'package:accordion/accordion.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utils/theme.dart';

class V2ProfileHolidayAvailabilityView extends StatefulWidget {
  const V2ProfileHolidayAvailabilityView({Key? key}) : super(key: key);

  @override
  _V2ProfileHolidayAvailabilityViewState createState() =>
      _V2ProfileHolidayAvailabilityViewState();
}

class _V2ProfileHolidayAvailabilityViewState
    extends State<V2ProfileHolidayAvailabilityView> {
  MyThemeColors get _myThemeColors =>
      Theme.of(context).extension<MyThemeColors>()!;
  bool _isLoading = false;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 2);
  }

  Widget getContent() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text(
        //   'Profile/Holiday Availability',
        //   style: MyFonts.regular(20, color: _myThemeColors.primary),
        //   textAlign: TextAlign.center,
        // ),
        getContent2(),
        getContent3(),
      ],
    );
  }

  bool isChecked = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  bool isOpen = false;
  Widget getContent3() {
    return Accordion(
      paddingListTop: 0,
      maxOpenSections: 1,
      rightIcon: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12),
        child: Image.asset(
          'lib/images/Polygon 1.png',
          height: 8,
          width: 10,
        ),
      ),
      headerBorderRadius: 6,
      headerBackgroundColor: MyColors.v2Primary,
      headerPadding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      children: [
        AccordionSection(
          isOpen: false, // Set the initial state here
          header: Text(
            "Request time off",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.white, // Set the text color to white
            ),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 450,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [],
              ),
              child: Column(
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return TableCalendar(
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
                    );
                  }),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green), // Set the background color
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )), // Remove border radius
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(150, 48),
                        ), // Set the button size
                      ),
                      child: Text(
                        'Request',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ), // Set the font size
                    ),
                  ),
                ],
              ),
            ),
          ),

          contentBorderColor: MyColors.lightGrey,
        ),
      ],
    );
  }

  Widget getContent2() {
    final List<String> yearList = [
      "Update Availability",
    ];
    Map<String, bool> selectedDays = {
      'Monday': false,
      'Tuesday': false,
      'Wednesday': false,
      'Thursday': false,
      'Friday': false,
      'Saturday': false,
      'Sunday': false,
      'Night Work': false,
    };

    return Accordion(
      paddingListTop: 0,
      paddingListBottom: 0,
      maxOpenSections: 1,
      rightIcon: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12),
        child: Image.asset(
          'lib/images/Polygon 1.png',
          height: 8,
          width: 10,
        ),
      ),
      headerBorderRadius: 6,
      headerBackgroundColor: MyColors.v2Primary,
      headerPadding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      paddingBetweenClosedSections: double.nan,
      children: yearList.map((item) {
        return AccordionSection(
          isOpen: false,
          header: Text(
            item,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 250,
                child: ListView(
                  shrinkWrap: true,
                  children: selectedDays.keys.map((day) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Checkbox(
                                value: selectedDays[day]!,
                                activeColor: MyColors.darkBlue,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    selectedDays[day] = newValue!;
                                  });
                                },
                                shape: CircleBorder(),
                              ),
                            ),
                            Text(
                              day,
                              style:
                                  TextStyle(fontFamily: 'Roboto', fontSize: 20),
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(150, 48),
                    ),
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          contentBorderColor: MyColors.lightGrey,
        );
      }).toList(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'Holiday Availability');
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
