import 'package:extra_staff/controllers/choose_password_c.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/enter_code_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChoosePassword extends StatelessWidget {
  final double textFiledWidth = 60;
  final ChoosePasswordController choosePasswordController =
      ChoosePasswordController();

  Widget txtField(context) {
    return SizedBox(
      width: textFiledWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        borderOnForeground: true,
        elevation: 10,
        child: TextField(
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
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blue,
      appBar: abPreferredSize(''),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter Passcode',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white,
                  ),
                ),
                abSpacing(32),
                Container(
                  height: textFiledWidth,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      txtField(context),
                      txtField(context),
                      txtField(context),
                      txtField(context),
                    ],
                  ),
                ),
                abSpacing(32),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: 1.2,
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: choosePasswordController.allItems
                        .map(
                          (item) => GridTile(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyColors.offBlue,
                              ),
                              child: Center(
                                child: create(item),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                abSpacing(32),
                Text(
                  "Forgot/Reset passcode?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.white,
                  ),
                ),
                abSpacing(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not yet registered? ",
                      style: TextStyle(
                        color: MyColors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(EnterCode()),
                      child: Text(
                        "Click here",
                        style: TextStyle(color: MyColors.offBlue),
                      ),
                    ),
                  ],
                ),
                abSpacing(32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget create(item) {
    if (item == '-1') {
      return Icon(
        Icons.backspace_outlined,
        size: 35,
        color: MyColors.white,
      );
    } else if (item == '+1') {
      return Icon(
        Icons.tag_faces_outlined,
        size: 35,
        color: MyColors.white,
      );
    } else {
      return Text(
        item,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          color: MyColors.white,
        ),
      );
    }
  }
}
