import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

PreferredSize abPreferredSize(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: TextButton(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: MyColors.black,
                      size: 20,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSize abQuestions(
    double width, Duration duration, bool showHome, int current, int total) {
  final indent = ((width - 56) / total) * current;
  return PreferredSize(
    preferredSize: Size.fromHeight(100),
    child: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '0$current',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '/ 0$total',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: MyColors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: MyColors.grey,
                      ),
                    ),
                  ),
                  showHome
                      ? Container(
                          height: 40,
                          alignment: AlignmentDirectional.centerEnd,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.home,
                              size: 30,
                              color: MyColors.offBlue,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              height: 10,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Divider(
                    height: 0,
                    thickness: 2,
                    color: MyColors.grey,
                  ),
                  AnimatedContainer(
                    color: MyColors.blue,
                    height: 8,
                    width: indent,
                    duration: duration,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

SizedBox abSpacing(double s) {
  return SizedBox(
    height: s,
  );
}
