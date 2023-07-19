import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/v2/work_v.dart';
import 'package:extra_staff/views/v2/profile_v.dart';
import 'package:extra_staff/views/v2/notifications_v.dart';
import 'package:extra_staff/views/v2/settings_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String triangleUp =
    '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" stroke="#14C567" fill="#14C567" viewBox="0 0 24 24"><path d="M24 22h-24l12-20z"/></svg>';
const String triangleDown =
    '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" stroke="#FF0000" fill="#FF0000"  viewBox="0 0 24 24"><path d="M24 22h-24l12-20z"/></svg>';

class V2HomeView extends StatefulWidget {
  const V2HomeView({Key? key}) : super(key: key);

  @override
  _V2HomeViewState createState() => _V2HomeViewState();
}

class _V2HomeViewState extends State<V2HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  bool isLoading = false;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

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
    Widget weeklyShift = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Weekly Shift',
          style: MyFonts.regular(20, color: MyColors.v2Primary),
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
    );
    Widget achievements = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Achievements',
          style: MyFonts.regular(20, color: MyColors.v2Primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Container(
          // decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: TabBar(
            controller: _controller,
            labelColor: MyColors.v2Primary,
            labelStyle: MyFonts.medium(16, color: MyColors.v2Primary),
            indicatorColor: MyColors.v2Primary,
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
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Shifts worked",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Shifts Assigned",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("1", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Projected wage",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("£1250", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      Transform.scale(
                                        scaleY: -1,
                                        child: SvgPicture.string(
                                          triangleDown,
                                          width: 12,
                                          height: 12,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text("0", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Avg Shift", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("9hrs", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                  ]),
                  SizedBox(height: 14),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Hours worked",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("36", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("hrs", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Working streak",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("1", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("week", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Earnings", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("£155", style: MyFonts.regular(18))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("AWR count", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("weeks", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                  ])
                ],
              )),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Shifts worked",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Shifts Assigned",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("1", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Projected wage",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("£1250", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      Transform.scale(
                                        scaleY: -1,
                                        child: SvgPicture.string(
                                          triangleDown,
                                          width: 12,
                                          height: 12,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text("0", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Avg Shift", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("9hrs", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                  ]),
                  SizedBox(height: 14),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Hours worked",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("36", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("hrs", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Working streak",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("1", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("week", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Earnings", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("£155", style: MyFonts.regular(18))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("AWR count", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("weeks", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                  ])
                ],
              )),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Shifts worked",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Shifts Assigned",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("1", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Projected wage",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("£1250", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      Transform.scale(
                                        scaleY: -1,
                                        child: SvgPicture.string(
                                          triangleDown,
                                          width: 12,
                                          height: 12,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Text("0", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Avg Shift", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("9hrs", style: MyFonts.regular(16)),
                                      SizedBox(width: 6),
                                      SvgPicture.string(
                                        triangleUp,
                                        width: 12,
                                        height: 12,
                                      ),
                                      SizedBox(width: 6),
                                      Text("1", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                  ]),
                  SizedBox(height: 14),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Hours worked",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("36", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("hrs", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Working streak",
                                      style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("1", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("week", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Earnings", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("£155", style: MyFonts.regular(18))
                                    ],
                                  )
                                ]))),
                    SizedBox(width: 8),
                    Expanded(
                        child: Container(
                            height: 55,
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("AWR count", style: MyFonts.regular(11)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("4", style: MyFonts.regular(18)),
                                      SizedBox(width: 2),
                                      Text("weeks", style: MyFonts.regular(14))
                                    ],
                                  )
                                ]))),
                  ])
                ],
              )),
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
          style: MyFonts.regular(20, color: MyColors.v2Primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Text(
          'Lorem lpsum sit dolor para cambre los canos ce te pas',
          style: MyFonts.regular(16, color: MyColors.grey),
          textAlign: TextAlign.left,
        )
      ],
    );
    Widget availableJobs = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Available jobs',
          style: MyFonts.regular(20, color: MyColors.v2Primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Text(
          'Lorem lpsum sit dolor para cambre los canos ce te pas',
          style: MyFonts.regular(16, color: MyColors.grey),
          textAlign: TextAlign.left,
        )
      ],
    );
    Widget blogPost = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Blog Post',
          style: MyFonts.regular(20, color: MyColors.v2Primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 18),
        Text(
          'Lorem lpsum sit dolor para cambre los canos ce te pas',
          style: MyFonts.regular(16, color: MyColors.grey),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 18),
        Text(
          'If you want to turn off marketing messages',
          style: MyFonts.regular(16, color: MyColors.grey),
          textAlign: TextAlign.left,
        )
      ],
    );

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
        blogPost
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
                              image: AssetImage('lib/images/logo3.png'),
                              height: 20,
                              width: 60,
                            ),
                            Spacer(),
                            Switch(
                                // This bool value toggles the switch.
                                value: true,
                                activeColor: MyColors.v2Primary,
                                onChanged: (bool value) {}),
                            Icon(Icons.help_outline),
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
                        image: AssetImage('lib/images/logo3.png'),
                        height: 20,
                        width: 60,
                      ),
                      Spacer(),
                      Switch(
                          // This bool value toggles the switch.
                          value: true,
                          activeColor: MyColors.v2Primary,
                          onChanged: (bool value) {}),
                      Icon(Icons.help_outline),
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
        context, isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomNavigationBar:
            abV2BottomNavigationBarB(_selectedIndex, _onItemTapped));
  }
}
