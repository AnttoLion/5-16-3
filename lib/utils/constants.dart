import 'dart:io' show Platform;

import 'package:flutter/material.dart';

final double gPadding = 16;

final bool isiOS = Platform.isIOS;

class MyColors {
  static final blue = Color.fromRGBO(25, 69, 136, 1); //Colors.lightBlue[900];
  static final white = Colors.white;
  static final black = Colors.black;
  static final transparent = Colors.transparent;
  static final blueAccent = Colors.blueAccent;
  static final grey = Colors.grey;
  static final screenBackGround = Color.fromRGBO(245, 245, 245, 1);
  static final offBlue = Color.fromRGBO(32, 81, 156, 1); //Colors.blue[600];
}
