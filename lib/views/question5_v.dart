import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final duration = Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        finalWidth = MediaQuery.of(context).size.width;
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
                                child: questionButton('Yes',
                                    clicked: selection == 'Yes'),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                ),
                              ),
                              abSpacing(15),
                              TextButton(
                                onPressed: () => action(false),
                                child: questionButton('No',
                                    clicked: selection == 'No'),
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
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        opacity = 0;
        top = -finalHeight;
        bottom = finalHeight;
      });
      Future.delayed(duration, () {
        // Get.to(Question5View());
        setState(() {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
          opacity = 1;
        });
      });
    });
  }

  Widget questionButton(String title, {bool clicked = false}) {
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
}
