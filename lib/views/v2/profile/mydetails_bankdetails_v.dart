import 'package:extra_staff/utils/ab.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class V2ProfileMyDetailsBankDetailsView extends StatefulWidget {
  const V2ProfileMyDetailsBankDetailsView({Key? key}) : super(key: key);

  @override
  _V2ProfileMyDetailsBankDetailsViewState createState() =>
      _V2ProfileMyDetailsBankDetailsViewState();
}

class _V2ProfileMyDetailsBankDetailsViewState
    extends State<V2ProfileMyDetailsBankDetailsView> {
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
      child: Padding(
        padding: EdgeInsets.only(left: 35),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bank Details',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color(0xFF00458D),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Bank Name',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFF748A9D),
                ),
              ),
              Text(
                'Lorem lpsum',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFFA6BCD0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Sort Code',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFF748A9D),
                ),
              ),
              Text(
                'Lorem lpsum',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFFA6BCD0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Bank Account Number',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFF748A9D),
                ),
              ),
              Text(
                'Lorem lpsum',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFFA6BCD0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Xk0121948y2391492379283',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFF748A9D),
                ),
              ),
              Text(
                'Lorem lpsum',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFFA6BCD0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Bank Reference',
                style: TextStyle(
                  fontFamily: 'Be Vietnam Pro',
                  fontSize: 16,
                  color: Color(0xFF748A9D),
                ),
              ),
            ],
          ),
        ),
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
