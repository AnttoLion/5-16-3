import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/question1_v.dart';
import 'package:extra_staff/views/question2_v.dart';
import 'package:extra_staff/views/question3_v.dart';
import 'package:extra_staff/views/question4_v.dart';
import 'package:extra_staff/views/question5_v.dart';
import 'package:flutter/material.dart';

import 'package:extra_staff/controllers/page_controller_c.dart';

class QuestionsView extends StatelessWidget {
  final PageControllerController pageController = PageControllerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      child: PageView(
        controller: pageController.pageController,
        children: [
          for (var i in pageController.data.keys) Question1View(),
          Question2View(),
          Question3View(),
          Question4View(),
          Question5View()
        ],
      ),
    );
  }
}
