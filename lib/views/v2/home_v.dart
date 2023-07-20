import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/utils/theme.dart';
import 'package:extra_staff/views/v2/work_v.dart';
import 'package:extra_staff/views/v2/profile_v.dart';
import 'package:extra_staff/views/v2/notifications_v.dart';
import 'package:extra_staff/views/v2/settings_v.dart';
import 'package:extra_staff/views/v2/help_v.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

const String svgTriangleUp =
    '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" stroke="#14C567" fill="#14C567" viewBox="0 0 24 24"><path d="M24 22h-24l12-20z"/></svg>';
const String svgTriangleDown =
    '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" stroke="#FF0000" fill="#FF0000"  viewBox="0 0 24 24"><path d="M24 22h-24l12-20z"/></svg>';

class V2HomeView extends StatefulWidget {
  const V2HomeView({Key? key}) : super(key: key);

  @override
  _V2HomeViewState createState() => _V2HomeViewState();
}

class _V2HomeViewState extends State<V2HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  bool _isLoading = false;
  int _selectedIndex = 2;
  final _themeTogglecontroller = ValueNotifier<bool>(false);
  bool get isThemeDark => Theme.of(context).brightness == Brightness.dark;
  MyThemeColors get myThemeColors =>
      Theme.of(context).extension<MyThemeColors>()!;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _themeTogglecontroller.addListener(() {
      if (_themeTogglecontroller.value) {
        AdaptiveTheme.of(context).setDark();
      } else {
        AdaptiveTheme.of(context).setLight();
      }
    });

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _themeTogglecontroller.value = isThemeDark;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigationForHomePage(index, 2);
  }

  Widget getStaticWeekdayWidget(List<int> checklist) {
    if (checklist.length != 7) return Container();
    Widget getCircleWidget(String label, int status) {
      Widget checkWidget = Container();
      switch (status) {
        case 1:
          checkWidget = RoundCheckBox(
            onTap: null,
            size: 30,
            isChecked: true,
            checkedColor: myThemeColors.primary,
            disabledColor: myThemeColors.primary,
            uncheckedColor: Colors.white,
            border: Border.all(
              width: 1,
              color: myThemeColors.primary!,
            ),
          );
          break;
        case -1:
          checkWidget = RoundCheckBox(
            onTap: null,
            size: 30,
            isChecked: false,
            checkedColor: myThemeColors.primary,
            disabledColor: MyColors.v2WeekdayGrey,
            uncheckedColor: Colors.white,
          );
          break;
        case 0:
          checkWidget = RoundCheckBox(
            onTap: null,
            size: 30,
            isChecked: false,
            checkedColor: myThemeColors.primary,
            disabledColor: MyColors.white,
            uncheckedColor: Colors.white,
            border: Border.all(
              width: 1,
              color: myThemeColors.primary!,
            ),
          );
          break;
        default:
      }
      return Container(
          // margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            checkWidget,
            Text(
              label,
              style: MyFonts.regular(16, color: myThemeColors.primary),
              textAlign: TextAlign.center,
            ),
          ]));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        getCircleWidget("M", checklist[0]),
        Spacer(),
        getCircleWidget("T", checklist[1]),
        Spacer(),
        getCircleWidget("W", checklist[2]),
        Spacer(),
        getCircleWidget("T", checklist[3]),
        Spacer(),
        getCircleWidget("F", checklist[4]),
        Spacer(),
        getCircleWidget("S", checklist[5]),
        Spacer(),
        getCircleWidget("S", checklist[6]),
      ],
    );
  }

  Widget getAchievementsItemWidget(String title, int value1, {int? value2}) {
    Widget triangleUp = SvgPicture.string(
      svgTriangleUp,
      width: 12,
      height: 12,
    );
    Widget triangleDown = Transform.scale(
      scaleY: -1,
      child: SvgPicture.string(
        svgTriangleDown,
        width: 12,
        height: 12,
      ),
    );
    Widget secondWidget = Container();
    String prefix = "";
    String suffix = "";
    if (title == "Projected wage") {
      prefix = "£";
    }
    if (title == "Avg Shift") {
      suffix = value1 > 1 ? "hrs" : "hr";
    }
    if (title == "Hours worked") {
      suffix = value1 > 1 ? "hrs" : "hr";
    }
    if (title == "Working streak") {
      suffix = value1 > 1 ? "weeks" : "week";
    }
    if (title == "Earnings") {
      prefix = "£";
    }
    if (title == "AWR count") {
      suffix = value1 > 1 ? "weeks" : "week";
    }

    switch (title) {
      case "Shifts worked":
      case "Shifts Assigned":
      case "Projected wage":
      case "Avg Shift":
        secondWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(prefix + value1.toString() + suffix,
                style: MyFonts.regular(16)),
            SizedBox(width: 6),
            value2! > 0 ? triangleUp : triangleDown,
            SizedBox(width: 6),
            Text(value2.toString(), style: MyFonts.regular(14))
          ],
        );
        break;
      case "Hours worked":
      case "Working streak":
      case "Earnings":
      case "AWR count":
        secondWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(prefix + value1.toString(), style: MyFonts.regular(18)),
            SizedBox(width: 2),
            Text(suffix, style: MyFonts.regular(14))
          ],
        );
        break;
      default:
    }
    return Container(
        height: 55,
        padding: const EdgeInsets.all(4),
        color: myThemeColors.itemContainerBackground,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title, style: MyFonts.regular(11)),
          SizedBox(height: 6),
          secondWidget
        ]));
  }

  Widget getYourNotificationsItemWidget(String title, String content) {
    return Container(
        height: 68,
        width: 237,
        padding: const EdgeInsets.all(8),
        color: myThemeColors.itemContainerBackground,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundCheckBox(
                    onTap: null,
                    size: 25,
                    isChecked: true,
                    checkedColor: myThemeColors.primary,
                    disabledColor: MyColors.lightGrey,
                    uncheckedColor: Colors.white,
                  ),
                  SizedBox(width: 6),
                  Text(title, style: MyFonts.medium(18))
                ],
              ),
              SizedBox(height: 6),
              Text(content,
                  style: MyFonts.regular(14, color: myThemeColors.primary))
            ]));
  }

  Widget getAvailableJobsItemWidget(String title, String location, String pay,
      String duration, String agoTime) {
    return Container(
        height: 167,
        width: 307,
        padding: const EdgeInsets.all(8),
        color: myThemeColors.itemContainerBackground,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: MyFonts.regular(14, color: MyColors.grey),
                      children: <TextSpan>[
                        TextSpan(text: 'Pay: '),
                        TextSpan(
                            text: pay,
                            style: TextStyle(
                                color: myThemeColors.primary,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  RichText(
                    text: TextSpan(
                      style: MyFonts.regular(14, color: MyColors.grey),
                      children: <TextSpan>[
                        TextSpan(text: 'Duration: '),
                        TextSpan(
                            text: duration,
                            style: TextStyle(
                                color: myThemeColors.primary,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
              Text(title, style: MyFonts.medium(18)),
              Text(location, style: MyFonts.regular(14, color: MyColors.grey)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  abV2PrimaryButton("APPLY NOW", onTap: () => {}),
                  Spacer(),
                  Text("Post " + agoTime,
                      style: MyFonts.regular(14, color: myThemeColors.primary)),
                ],
              ),
            ]));
  }

  Widget getBlogWidget(String image, String title, String date) {
    return Container(
        height: 340,
        padding: const EdgeInsets.all(16),
        color: myThemeColors.itemContainerBackground,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 156, color: MyColors.lightGrey),
              SizedBox(height: 12),
              Text(date, style: MyFonts.regular(14, color: MyColors.grey)),
              SizedBox(height: 6),
              Row(children: [
                Expanded(
                  child: Text(title, style: MyFonts.bold(22)),
                  flex: 2,
                ),
                Spacer(),
              ]),
              SizedBox(height: 12),
              Row(children: [
                Spacer(),
                abV2PrimaryButton("READ MORE", onTap: () => {}),
              ])
            ]));
  }

  Widget getContent() {
    Widget weeklyShift = Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weekly Shift',
              style: MyFonts.regular(20, color: myThemeColors.primary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18),
            Text(
              'Lorem lpsum sit dolor para cambre los canos ce te pas',
              style: MyFonts.regular(16, color: MyColors.grey),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 13),
            getStaticWeekdayWidget([1, -1, 1, 1, 1, 0, -1])
          ],
        ));
    Widget achievements7dayContainer = Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: getAchievementsItemWidget("Shifts worked", 4, value2: 1)),
          SizedBox(width: 8),
          Expanded(
              child:
                  getAchievementsItemWidget("Shifts Assigned", 2, value2: 1)),
          SizedBox(width: 8),
          Expanded(
              child:
                  getAchievementsItemWidget("Projected wage", 1250, value2: 0)),
          SizedBox(width: 8),
          Expanded(child: getAchievementsItemWidget("Avg Shift", 9, value2: 1))
        ]),
        SizedBox(height: 14),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(child: getAchievementsItemWidget("Hours worked", 36)),
          SizedBox(width: 8),
          Expanded(child: getAchievementsItemWidget("Working streak", 1)),
          SizedBox(width: 8),
          Expanded(child: getAchievementsItemWidget("Earnings", 155)),
          SizedBox(width: 8),
          Expanded(child: getAchievementsItemWidget("AWR count", 4))
        ]),
      ],
    ));

    Widget achievements30dayContainer = achievements7dayContainer;
    Widget achievements90dayContainer = achievements7dayContainer;
    Widget achievements = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Achievements',
          style: MyFonts.regular(20, color: myThemeColors.primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Container(
          child: TabBar(
            controller: _controller,
            labelColor: myThemeColors.primary,
            labelStyle: MyFonts.medium(16, color: myThemeColors.primary),
            indicatorColor: myThemeColors.primary,
            tabs: [
              Tab(
                text: '7 Days',
              ),
              Tab(
                text: '30 Days',
              ),
              Tab(
                text: '90 Days',
              ),
            ],
          ),
        ),
        // Border
        Container(
          // Negative padding
          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
          // Add top border
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFc3c3c3),
                width: 0.6,
              ),
            ),
          ),
        ),

        Container(
          height: 130.0,
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              achievements7dayContainer,
              achievements30dayContainer,
              achievements90dayContainer
            ],
          ),
        ),
      ],
    );
    Widget yourNotifications = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your notifications',
          style: MyFonts.regular(20, color: myThemeColors.primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Container(
            height: 68,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getYourNotificationsItemWidget(
                    "Checked out", "Shift ended for LGV Class 1 driving"),
                SizedBox(width: 12),
                getYourNotificationsItemWidget(
                    "Checked out", "Shift ended for LGV Class 1 driving"),
                SizedBox(width: 12),
                getYourNotificationsItemWidget(
                    "Checked out", "Shift ended for LGV Class 1 driving"),
                SizedBox(width: 12),
                getYourNotificationsItemWidget(
                    "Checked out", "Shift ended for LGV Class 1 driving"),
              ],
            ))
      ],
    );
    Widget availableJobs = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Available jobs',
          style: MyFonts.regular(20, color: myThemeColors.primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Container(
            height: 167,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getAvailableJobsItemWidget("LGV Class 1 Driver", "DPD, Enfield",
                    "£15per hour", "9am-5pm", "5 minutes ago"),
                SizedBox(width: 12),
                getAvailableJobsItemWidget("LGV Class 1 Driver", "DPD, Enfield",
                    "£15per hour", "9am-5pm", "5 minutes ago"),
                SizedBox(width: 12),
                getAvailableJobsItemWidget("LGV Class 1 Driver", "DPD, Enfield",
                    "£15per hour", "9am-5pm", "5 minutes ago"),
              ],
            ))
      ],
    );
    Widget blogPost = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Blog Post',
          style: MyFonts.regular(20, color: myThemeColors.primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        getBlogWidget(
            "", "Lorem Ipsum Sit Dolor las bloge here", "December x, 2022"),
      ],
    );
    Widget marketingMessage =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      RichText(
        text: TextSpan(
          style: MyFonts.regular(13, color: MyColors.grey),
          children: <TextSpan>[
            TextSpan(text: 'If you want to '),
            TextSpan(
                text: 'turn off',
                style: TextStyle(
                    color: myThemeColors.primary,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('turn off');
                  }),
            TextSpan(text: ' marketing messages'),
          ],
        ),
      )
    ]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        weeklyShift,
        SizedBox(height: 42),
        achievements,
        SizedBox(height: 42),
        yourNotifications,
        SizedBox(height: 42),
        availableJobs,
        SizedBox(height: 42),
        blogPost,
        SizedBox(height: 8),
        marketingMessage,
        SizedBox(height: 24),
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
                            Image(
                              image: AssetImage('lib/images/v2/logo_icon.png'),
                              height: 20,
                              width: 60,
                            ),
                            Spacer(),
                            AdvancedSwitch(
                              activeChild: Icon(
                                Icons.light_mode_outlined,
                              ),
                              inactiveChild: Icon(Icons.dark_mode_outlined),
                              activeColor: myThemeColors.primary!,
                              inactiveColor: myThemeColors.primary!,
                              width: 60,
                              height: 28,
                              controller: _themeTogglecontroller,
                            ),
                            SizedBox(width: 12),
                            IconButton(
                                onPressed: () {
                                  Get.to(() => V2HelpView());
                                },
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.help_outline, size: 30)),
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
                      Image(
                        image: AssetImage('lib/images/v2/logo_icon.png'),
                        height: 20,
                        width: 60,
                      ),
                      Spacer(),
                      AdvancedSwitch(
                        activeChild: Icon(
                          Icons.light_mode_outlined,
                        ),
                        inactiveChild: Icon(Icons.dark_mode_outlined),
                        activeColor: myThemeColors.primary!,
                        inactiveColor: myThemeColors.primary!,
                        width: 60,
                        height: 28,
                        controller: _themeTogglecontroller,
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.help_outline, size: 30),
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
    return abV2MainWidgetWithLoadingOverlayScaffoldScrollView(
        context, _isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomNavigationBar:
            abV2BottomNavigationBarB(_selectedIndex, _onItemTapped));
  }
}
