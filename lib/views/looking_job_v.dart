import 'package:extra_staff/controllers/looking_job_c.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/quick_temp_add_v.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LookingForAJob extends StatelessWidget {
  final LookingJobController lookingJobController = LookingJobController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Start',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 300,
                child: GetBuilder<LookingJobController>(
                  init: lookingJobController,
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.allQuestions.length,
                      itemBuilder: (context, position) {
                        return form(controller, position);
                      },
                    );
                  },
                ),
              ),
              Container(
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buttons('Proceed'),
                    abSpacing(10),
                    buttons('Go back'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttons(String title) {
    return ElevatedButton(
      onPressed: () {
        if (title == 'Go back') {
          Get.back();
        } else {
          print('Proceed');
          Get.to(QuickTempAdd());
        }
      },
      child: Text(
        title.toUpperCase(),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.all(16),
        primary: MyColors.blue,
      ),
    );
  }

  Widget form(LookingJobController controller, int position) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Radio(
                  value: lookingJobController.yes,
                  groupValue: controller.ansValue,
                  onChanged: (value) => controller.handleValueChanged(value),
                ),
                Text('YES'),
                SizedBox(width: 10),
                Radio(
                  value: lookingJobController.no,
                  groupValue: controller.ansValue,
                  onChanged: (value) => controller.handleValueChanged(value),
                ),
                Text('NO'),
              ],
            ),
          ),
          Text(
            'Question $position - ${controller.allQuestions[position]}'
                .toUpperCase(),
            textAlign: TextAlign.start,
          ),
          abSpacing(16),
        ],
      ),
    );
  }
}
