import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QuickTempAddController extends GetxController {
  String? email;
  final dropdownItems = [Colors.orange, Colors.blue[300], Colors.green];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Color dropdownValue = Colors.orange;

  dropdonwlchange(value) {
    dropdownValue = value;
  }

  void validateAndSave() {}
}
