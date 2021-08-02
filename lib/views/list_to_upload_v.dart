import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'looking_job_v.dart';

class ListToUploadView extends StatelessWidget {
  final duration = Duration(milliseconds: 500);
  Widget button(IconData image, String title) {
    return AnimatedContainer(
      height: 50,
      duration: duration,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2, color: MyColors.offBlue),
        color: MyColors.white,
      ),
      child: InkWell(
        onTap: () {
          Get.to(LookingForAJob());
        },
        child: Row(
          children: [
            // Icon(
            //   image,
            //   color: MyColors.offBlue,
            // ),
            // SizedBox(width: 8),
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.offBlue,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: MyColors.offBlue,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          abQuestions(MediaQuery.of(context).size.width, duration, true, 1, 1),
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28),
                color: MyColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'We need proof of your ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 28,
                          color: MyColors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'National Insurance',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: MyColors.offBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    button(Icons.arrow_back, 'Bank Statement'),
                    Row(
                      children: [
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: MyColors.blue,
                          child: Icon(Icons.cancel),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: MyColors.blue,
                          child: Icon(Icons.camera),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: MyColors.blue,
                          child: Icon(Icons.camera),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        Spacer()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28),
                color: MyColors.offBlue,
                child: Column(
                  children: [
                    abSpacing(32),
                    button(Icons.camera_alt, 'Proceed'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
