import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:extra_staff/views/intro_v.dart';
import 'package:extra_staff/controllers/page_controller_c.dart';

class PageControllerView extends StatelessWidget {
  final PageControllerController pageController = PageControllerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      child: PageView(
        controller: pageController.pageController,
        children: [
          for (var i in pageController.data.keys) IntroView(i, pageController)
        ],
      ),
    );
  }
}
