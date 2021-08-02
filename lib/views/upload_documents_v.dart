import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/list_to_upload_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadDocumentsView extends StatelessWidget {
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
        onTap: () {},
        child: Row(
          children: [
            Icon(
              image,
              color: MyColors.offBlue,
            ),
            SizedBox(width: 8),
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
      body: InkWell(
        onTap: () {
          Get.to(ListToUploadView());
        },
        child: Container(
          color: Colors.amberAccent,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  color: MyColors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'You need to upload your ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 28,
                            color: MyColors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'passport',
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
                        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: MyColors.offBlue,
                        ),
                      )
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
                      InkWell(
                        onTap: () {
                          Get.to(ListToUploadView());
                        },
                        child: button(Icons.camera_alt, 'Use camera'),
                      ),
                      abSpacing(16),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: MyColors.blue,
                        child: Text(
                          'OR',
                          style: TextStyle(color: MyColors.white),
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                      abSpacing(16),
                      InkWell(
                        onTap: () {
                          Get.to(ListToUploadView());
                        },
                        child: button(Icons.image, 'Select document'),
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
}
