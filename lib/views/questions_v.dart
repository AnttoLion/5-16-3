import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_wizard_v.dart';

class QuestionsView extends StatefulWidget {
  @override
  _QuestionsView createState() => _QuestionsView();
}

class _QuestionsView extends State<QuestionsView> {
  var left = 0.0;
  var right = 0.0;
  var top = 0.0;
  var bottom = 0.0;
  var opacity = 0.0;
  var finalWidth = 0.0;
  var khaasTop = 0.0;
  var finalHeight = 100.0;
  var selection = '';
  var anime = 0.0;
  var question = {};
  var counter = -1;
  var stacks = [0, 1, 2];
  final duration = Duration(milliseconds: 500);
  final rippleList = GlobalKey<AnimatedListState>();

  final data = [
    {
      'text': 'Are you able to Work in UK?',
      'highlight': 'Work in UK?',
      'key': 'Eligibility'
    },
    {
      'text': 'Are you a driver with a full licence?',
      'highlight': 'driver with a full licence?',
      'key': 'Driver/Warehouse'
    },
    {
      'text': 'Are you looking for business grow on online market?',
      'highlight': 'business',
      'key': 'Online business'
    },
    {
      'text': 'What is your current roll in your existing company?',
      'highlight': 'roll company?',
      'key': 'Organization roll'
    },
    {
      'text': 'Which architecture you would like to work on project?',
      'highlight': 'architecture project?',
      'key': 'Architecture planning'
    },
  ];

  @override
  void initState() {
    super.initState();
    reset();
  }

  Widget questions() {
    return Flexible(
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
                child: abQuestion(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget abQuestion() {
    if (question.isNotEmpty) {
      final key = question['key'];
      final strs = question['text'].split(' ');
      final words = question['highlight'].split(' ');
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            children: [
              for (var j in strs)
                Text(
                  j + ' ',
                  style: words.contains(j)
                      ? TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: MyColors.offBlue,
                        )
                      : TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 28,
                          color: MyColors.black,
                        ),
                ),
            ],
          ),
          Text(
            key,
            style: TextStyle(
              color: MyColors.grey,
              fontSize: 18,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget answer() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        color: MyColors.blue,
        child: Stack(
          children: [
            bottomRipples(),
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
                      child: questionButton('Yes', selection == 'Yes'),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                    abSpacing(15),
                    TextButton(
                      onPressed: () => action(false),
                      child: questionButton('No', selection == 'No'),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomRipples() {
    final size = MediaQuery.of(context).size.width - 56;
    return AnimatedList(
      key: rippleList,
      initialItemCount: stacks.length,
      itemBuilder: (context, index, animation) {
        final f = (khaasTop * -1) / 10;
        final fsize = size - (f >= index ? 0 : (index - f) * 56);
        var fopa = 0.0;
        if (data.length + 1 == index ||
            data.length == index ||
            data.length - 1 == index) {
          fopa = 0.0;
        } else if (index == stacks.length - 1) {
          fopa = 0.3;
        } else if (index == stacks.length - 2) {
          fopa = 0.6;
        } else if (index == stacks.length - 3) {
          fopa = 0.9;
        } else {
          fopa = 1.0;
        }
        return Container(
          height: 10,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              AnimatedPositioned(
                duration: duration,
                top: khaasTop,
                height: 10,
                width: fsize,
                child: Container(
                  color: MyColors.white.withOpacity(fopa),
                ),
              ),
            ],
          ),
        );
      },
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: abQuestions(MediaQuery.of(context).size.width, duration, false,
          counter + 1, data.length),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [questions(), answer()],
          ),
        ),
      ),
    );
  }

  void action(bool isYes) {
    rippleList.currentState!.insertItem(3);
    setState(() {
      stacks.add(3);
      anime = 5;
      selection = isYes ? 'Yes' : 'No';
      khaasTop += -10;
    });
    Future.delayed(Duration(milliseconds: 250), () => setState(() => anime = 0))
        .then((value) {
      Future.delayed(duration, () {
        setState(() {
          opacity = 0;
          if (counter == data.length - 1) {
            top = -finalHeight;
            bottom = finalHeight;
          } else {
            left = -finalWidth;
            right = finalWidth;
          }
        });
      }).then((value) => reset()).then((value) {
        if (counter == data.length - 1) {
          Future.delayed(duration, () => Get.to(OnboardingWizard()));
        }
      });
    });
  }

  reset() {
    Future.delayed(duration, () {
      setState(() {
        selection = '';
        counter = counter < data.length - 1 ? counter + 1 : 0;
        question = data[counter];
        finalWidth = MediaQuery.of(context).size.width - 56;
        finalHeight = (MediaQuery.of(context).size.height - 100) / 2;
        left = finalWidth;
        right = -finalWidth;
      });
    }).then((value) {
      Future.delayed(duration, () {
        setState(() {
          top = 0;
          bottom = 0;
          left = 0;
          right = 0;
          opacity = 1;
        });
      });
    });
  }
}
