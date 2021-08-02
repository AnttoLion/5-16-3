import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/upload_documents_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingWizard extends StatefulWidget {
  const OnboardingWizard({Key? key}) : super(key: key);

  @override
  _OnboardingWizardState createState() => _OnboardingWizardState();
}

class _OnboardingWizardState extends State<OnboardingWizard> {
  var counter = -1;
  var left = 0.0;
  var right = 0.0;
  var top = 0.0;
  var bottom = 0.0;
  var opacity = 0.0;
  var isCorrect = 0;
  var question = {};
  var selectedAnswer = '';
  var correctAnswer = 'Wear safety boots'.toUpperCase();
  final duration = Duration(milliseconds: 500);
  final data = [
    {
      'text': 'What does this sign mean?',
      'highlight': 'sign mean?',
      'key': 'exit.png'
    },
    {
      'text': 'What does this sign mean?',
      'highlight': 'sign mean?',
      'key': 'exit.png'
    },
    {
      'text': 'What does this sign mean?',
      'highlight': 'sign mean?',
      'key': 'exit.png'
    },
    {
      'text': 'What does this sign mean?',
      'highlight': 'sign mean?',
      'key': 'exit.png'
    },
  ];

  @override
  void initState() {
    super.initState();
    reset();
  }

  reset() {
    Future.delayed(duration, () {
      setState(() {
        // selection = '';
        counter = counter < data.length - 1 ? counter + 1 : 0;
        question = data[counter];
        // finalWidth = MediaQuery.of(context).size.width - 56;
        // finalHeight = (MediaQuery.of(context).size.height - 100) / 2;
        left = MediaQuery.of(context).size.width - 56;
        right = -(MediaQuery.of(context).size.height - 100) / 2;
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

  Widget questions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28),
      color: MyColors.white,
      height: (MediaQuery.of(context).size.height - 200) / 2,
      width: MediaQuery.of(context).size.width - 200,
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
    );
  }

  Widget abQuestion() {
    if (question.isNotEmpty) {
      final key = question['key'];
      final strs = question['text'].split(' ');
      final words = question['highlight'].split(' ');
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          // Image.network(
          //   key,
          //   height: 100,
          //   fit: BoxFit.cover,
          //   alignment: Alignment.centerLeft,
          // ),
          Image(
            image: AssetImage('lib/images/$key'),
            height: 100,
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget options() {
    return Container(
      height: 224,
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          button('Fire Exit', false),
          button('Wear safety boots', false),
          button('Way out', false),
          button('No parking', false),
        ],
      ),
    );
  }

  Widget button(String title, bool isProceed) {
    final isSelected = title.toUpperCase() == selectedAnswer;
    return AnimatedContainer(
      height: 50,
      duration: duration,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2, color: MyColors.offBlue),
        color: isCorrect != 0 && isSelected
            ? isCorrect == 1
                ? Colors.green
                : Colors.red
            : isSelected
                ? MyColors.offBlue
                : MyColors.white,
      ),
      child: InkWell(
        onTap: () {
          if (selectedAnswer.isEmpty || isProceed) {
            if (isProceed) {
              if (selectedAnswer.isEmpty) {
                Get.snackbar('Note', 'Please select atlease one option first.');
              } else {
                setState(() {
                  isCorrect = selectedAnswer == correctAnswer ? 1 : 2;
                });
                Future.delayed(Duration(milliseconds: 1000), () {
                  setState(() {
                    isCorrect = 0;
                    selectedAnswer = '';
                  });
                  if (counter == data.length - 1) {
                    Get.to(UploadDocumentsView());
                  }
                }).then((value) => reset());
              }
            } else {
              setState(() {
                selectedAnswer = title.toUpperCase();
              });
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? MyColors.white : MyColors.offBlue,
              ),
            ),
            Row(
              children: [
                Icon(
                  isCorrect == 1 ? Icons.check : Icons.close,
                  color: isSelected && isCorrect != 0
                      ? MyColors.white
                      : MyColors.transparent,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: isSelected ? MyColors.white : MyColors.offBlue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomView() {
    return Container(
      height: 100,
      color: MyColors.offBlue,
      padding: EdgeInsets.fromLTRB(28, 25, 28, 25),
      child: button('Proceed', true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: abQuestions(MediaQuery.of(context).size.width, duration, true,
          counter + 1, data.length),
      body: SafeArea(
        child: Container(
          color: MyColors.white,
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      questions(),
                      options(),
                      abSpacing(32),
                      bottomView(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
