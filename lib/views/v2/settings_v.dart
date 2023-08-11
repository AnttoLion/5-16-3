import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class V2SettingsView extends StatefulWidget {
  const V2SettingsView({Key? key}) : super(key: key);

  @override
  _V2SettingsViewState createState() => _V2SettingsViewState();
}

class _V2SettingsViewState extends State<V2SettingsView> {
  bool _isLoading = false;
  int _selectedIndex = 4;
  bool _isLocationEnabled = true;
  bool _isFacialRecognitionEnabled = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 4);
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Accounts',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Color(0xFF00458D),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 20,
                          color: Color(0xFF748A9D),
                        ),
                      ),
                      Text(
                        'abc@gmail.com',
                        style: TextStyle(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 20,
                          color: Color(0xFFA6BCD0),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 20,
                          color: Color(0xFF748A9D),
                        ),
                      ),
                      Text(
                        '+123456789',
                        style: TextStyle(
                          fontFamily: 'Be Vietnam Pro',
                          fontSize: 20,
                          color: Color(0xFFA6BCD0),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 10.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Device Settings',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: Color(0xFF00458D),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Location',
                                      style: TextStyle(
                                        fontFamily: 'Be Vietnam Pro',
                                        fontSize: 20,
                                        color: Color(0xFF748A9D),
                                      ),
                                    ),
                                    Text(
                                      'London',
                                      style: TextStyle(
                                        fontFamily: 'Be Vietnam Pro',
                                        fontSize: 20,
                                        color: Color(0xFFA6BCD0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  value: _isLocationEnabled,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _isLocationEnabled = value;
                                    });
                                    // Add your logic for handling the switch button change here
                                  },
                                  activeTrackColor: Color(0xFF00458D),
                                  activeColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                        fontFamily: 'Be Vietnam Pro',
                                        fontSize: 20,
                                        color: Color(0xFF748A9D),
                                      ),
                                    ),
                                    Text(
                                      '**************',
                                      style: TextStyle(
                                        fontFamily: 'Be Vietnam Pro',
                                        fontSize: 20,
                                        color: Color(0xFFA6BCD0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // Add your logic for handling the password edit here
                                },
                                color: Color(0xFF748A9D),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Facial Recognition',
                                  style: TextStyle(
                                    fontFamily: 'Be Vietnam Pro',
                                    fontSize: 20,
                                    color: Color(0xFF748A9D),
                                  ),
                                ),
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  value: _isLocationEnabled,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _isLocationEnabled = value;
                                    });
                                    // Add your logic for handling the switch button change here
                                  },
                                  activeTrackColor: Color(0xFF00458D),
                                  activeColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ])),
              ]),
              SizedBox(height: 32.0),
              Container(
                width: 156,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF888A8C),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your sign-out logic here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF888A8C),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 12,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Add your logic for deleting the account here
                },
                child: Text(
                  'Delete Account',
                  style: TextStyle(
                    fontFamily: 'Be Vietnam Pro',
                    fontSize: 16,
                    color: Color(0xFF748A9D),
                  ),
                ),
                //style: TextButton.styleFrom(primary: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'v2_settings_view_appbar_title'.tr);
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
