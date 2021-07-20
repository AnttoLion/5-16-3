import 'package:extra_staff/views/welcome_v.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:extra_staff/views/page_controller_v.dart';

void main() {
  runApp(ExtraStaff());
}

class ExtraStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Extra Staff',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: PageControllerView(),
      // home: WelcomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
