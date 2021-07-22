import 'package:extra_staff/controllers/enter_code_c.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/registration_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'choose_password.dart';

class EnterCode extends StatelessWidget {
  final EnterCodeController enterCodeController = EnterCodeController();

  final double textFiledWidth = 60;

  Widget txtField(BuildContext context, int key) {
    return SizedBox(
      width: textFiledWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        borderOnForeground: true,
        elevation: 10,
        child: TextField(
          key: Key('$key'),
          maxLength: 1,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          textAlign: TextAlign.center,
          onChanged: (text) {
            print(text);
            FocusScope.of(context).nextFocus();
            final done = enterCodeController.addOtp(key, text);
            print(done);
            if (done) {
              Get.to(ChoosePassword());
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: abPreferredSize(''),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          margin: EdgeInsets.only(top: 100),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: textFiledWidth,
                  width: double.infinity,
                  child: GetBuilder(
                    init: enterCodeController,
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          txtField(context, 0),
                          txtField(context, 1),
                          txtField(context, 2),
                          txtField(context, 3),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  "Verification Code",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                abSpacing(16),
                Text(
                  "Please type the Verification Code sent to your device",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: MyColors.grey),
                ),
                abSpacing(32),
                abSpacing(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I don't recieve a code! "),
                    InkWell(
                      onTap: () {
                        Get.to(RegistrationView());
                      },
                      child: Text(
                        "Please resend",
                        style: TextStyle(color: MyColors.blue),
                      ),
                    ),
                  ],
                ),
                Text(
                  '* Changed your telephone number?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColors.blue),
                ),
                abSpacing(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
