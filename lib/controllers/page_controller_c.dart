import 'package:flutter/material.dart';

import 'package:extra_staff/views/welcome_v.dart';

import 'package:get/get.dart';

class PageControllerController {
  final pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  final data = {
    '1': "Register with Extrastaff to work the 1000's of jobs we post daily.",
    '2': 'Set your language',
    '3':
        "Register - 10 minutes interview - skype, team etx compliance - we check your docs work! - earn Doller right away",
  };

  onChange() {
    int nextPage = pageController.page!.toInt() + 1;
    if (nextPage >= data.length) {
      nextPage = 0;
      Get.to(WelcomeView());
    }

    pageController.animateToPage(nextPage,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
