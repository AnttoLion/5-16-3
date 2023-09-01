import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class V2ProfileMyDetailsSubDetailsView extends StatefulWidget {
  const V2ProfileMyDetailsSubDetailsView({Key? key}) : super(key: key);

  @override
  _V2ProfileMyDetailsSubDetailsViewState createState() =>
      _V2ProfileMyDetailsSubDetailsViewState();
}

class _V2ProfileMyDetailsSubDetailsViewState
    extends State<V2ProfileMyDetailsSubDetailsView> {
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Current Address Line',
                style: TextStyle(fontSize: 16, color: MyColors.grey),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: TextStyle(fontSize: 16, color: MyColors.black),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCBD6E2)),
                    ),
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'lib/images/v2/Group 3181.png',
                  height: 28,
                  width: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'lib/images/v2/Group 3255.png',
                  height: 44,
                  width: 57,
                ),
              ),
            ],
          ),
          SizedBox(height: 67),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Post Code',
                style: TextStyle(fontSize: 16, color: MyColors.grey),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: TextStyle(fontSize: 16, color: MyColors.black),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCBD6E2)),
                    ),
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'lib/images/v2/Group 3181.png',
                  height: 28,
                  width: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'lib/images/v2/Group 3255.png',
                  height: 44,
                  width: 57,
                ),
              ),
            ],
          ),
          SizedBox(height: 67),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Next of kin',
                style: TextStyle(fontSize: 16, color: MyColors.grey),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: TextStyle(fontSize: 16, color: MyColors.black),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCBD6E2)),
                    ),
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'lib/images/v2/Group 3181.png',
                  height: 28,
                  width: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'lib/images/v2/Group 3255.png',
                  height: 44,
                  width: 57,
                ),
              ),
            ],
          ),
          SizedBox(height: 67),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Phone number',
                style: TextStyle(fontSize: 16, color: MyColors.grey),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: TextStyle(fontSize: 16, color: MyColors.black),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCBD6E2)),
                    ),
                  ),
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  'lib/images/v2/Group 3181.png',
                  height: 28,
                  width: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'lib/images/v2/Group 3255.png',
                  height: 44,
                  width: 57,
                ),
              ),
            ],
          ),
          // SizedBox(height: 67),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Text(
          //       'Availability',
          //       style: TextStyle(fontSize: 16, color: MyColors.grey),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 3),
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextFormField(
          //         style: TextStyle(fontSize: 16, color: MyColors.black),
          //         decoration: InputDecoration(
          //           contentPadding:
          //               EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          //           border: OutlineInputBorder(
          //             borderSide: BorderSide(color: Color(0xFFCBD6E2)),
          //           ),
          //         ),
          //         enabled: false,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(5.0),
          //       child: Image.asset(
          //         'lib/images/v2/Group 3181.png',
          //         height: 28,
          //         width: 28,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Image.asset(
          //         'lib/images/v2/Group 3255.png',
          //         height: 44,
          //         width: 57,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, '', showBack: true);
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
