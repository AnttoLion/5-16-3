import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'looking_job_v.dart';

class Question5View extends StatefulWidget {
  @override
  _Question5View createState() => _Question5View();
}

class _Question5View extends State<Question5View> {
  var left = 0.0;
  var right = 0.0;
  var top = 0.0;
  var bottom = 0.0;
  var opacity = 0.0;
  var finalWidth = 0.0;
  var finalHeight = 100.0;
  var selection = '';
  var anime = 0.0;
  final duration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        finalWidth = MediaQuery.of(context).size.width - 56;
        finalHeight = (MediaQuery.of(context).size.height - 100) / 2;
        left = finalWidth;
        right = -finalWidth;
      });
    }).then((value) {
      Future.delayed(duration, () {
        setState(() {
          left = 0;
          right = 0;
          opacity = 1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: abQuestions(context, 5, 5),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  color: MyColors.white,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: duration,
                        top: top,
                        bottom: bottom,
                        left: left,
                        right: right,
                        child: AnimatedOpacity(
                          duration: duration,
                          opacity: opacity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: '',
                                  children: [
                                    TextSpan(
                                      text: 'Which ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 28,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'architecture',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: MyColors.offBlue,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' you would like to work on ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 28,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'project?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: MyColors.offBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Architecture planning',
                                style: TextStyle(
                                  color: MyColors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  color: MyColors.blue,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: duration,
                        top: top,
                        bottom: bottom,
                        left: left,
                        right: right,
                        child: AnimatedOpacity(
                          duration: duration,
                          opacity: opacity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              abSpacing(50),
                              TextButton(
                                onPressed: () => action(true),
                                child:
                                    questionButton('Yes', selection == 'Yes'),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                ),
                              ),
                              abSpacing(15),
                              TextButton(
                                onPressed: () => action(false),
                                child: questionButton('No', selection == 'No'),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void action(bool isYes) {
    setState(() {
      selection = isYes ? 'Yes' : 'No';
      anime = 5;
    });
    Future.delayed(Duration(milliseconds: 250), () {
      setState(() {
        anime = 0;
      });
    }).then((value) {
      Future.delayed(duration, () {
        setState(() {
          opacity = 0;
          top = -finalHeight;
          bottom = finalHeight;
        });
      }).then((value) {
        Future.delayed(duration, () {
          Get.to(LookingForAJob())?.then((value) {
            setState(() {
              left = 0;
              right = 0;
              top = 0;
              bottom = 0;
              opacity = 1;
            });
          });
        });
      });
    });
  }

  Widget questionButton(String title, bool clicked) {
    return Container(
      height: 75,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(clicked ? anime : 0),
        duration: duration,
        child: Stack(
          children: [
            Container(
              color: MyColors.white,
            ),
            AnimatedContainer(
              duration: duration,
              color: MyColors.offBlue,
              margin: EdgeInsets.only(left: clicked ? finalWidth : 5),
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedDefaultTextStyle(
                  child: Text(title),
                  duration: duration,
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
      ),
    );
  }
}
