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

PreferredSize abQuestions(context, int current, int total) {
  final indent =
      ((MediaQuery.of(context).size.width - 56) / total) * (total - current);
  print(indent);
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
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
                    child: TextButton(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: MyColors.grey,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              height: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Divider(
                    height: 0,
                    thickness: 2,
                    color: MyColors.grey,
                  ),
                  Divider(
                    height: 0,
                    endIndent: indent,
                    thickness: 8,
                    color: MyColors.blue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget abQuestionButton(String title, {bool clicked = false}) {
  return AnimatedContainer(
    height: 75,
    duration: Duration(milliseconds: 1000),
    child: Stack(
      children: [
        Container(
          color: MyColors.white,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          color: MyColors.offBlue,
          margin: EdgeInsets.only(left: clicked ? 500 : 5),
        ),
        Container(
          padding: EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedDefaultTextStyle(
              child: Text(title),
              duration: Duration(milliseconds: 1000),
              style: TextStyle(
                color: clicked ? MyColors.offBlue : MyColors.white,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

SizedBox abSpacing(double s) {
  return SizedBox(
    height: s,
  );
}
