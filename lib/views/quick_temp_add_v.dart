import 'package:extra_staff/controllers/quick_temp_add_c.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/enter_code_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class QuickTempAdd extends StatelessWidget {
  final QuickTempAddController quickTempAddController =
      QuickTempAddController();

  Widget title(String text) {
    return Text(
      text,
      style: TextStyle(color: MyColors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: abPreferredSize('Quick Temp add'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Form(
            key: quickTempAddController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                title('First Name'),
                abSpacing(8),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    maxLength: 30,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    validator: (text) => text!.isEmpty || text.length < 3
                        ? 'Please enter valid First Name'
                        : null,
                  ),
                ),
                abSpacing(8),
                title('Last Name'),
                abSpacing(8),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    maxLength: 30,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    validator: (text) => text!.isEmpty || text.length < 3
                        ? 'Please enter valid First Name'
                        : null,
                  ),
                ),
                abSpacing(8),
                title('Email'),
                abSpacing(8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.black),
                    color: MyColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GetBuilder<QuickTempAddController>(
                    init: quickTempAddController,
                    builder: (controller) {
                      return Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              elevation: 12,
                              value: quickTempAddController.dropdownValue,
                              items: quickTempAddController.dropdownItems.map(
                                (value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Icon(
                                      Icons.flag,
                                      color: value,
                                      size: 25,
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) =>
                                  quickTempAddController.dropdonwlchange(value),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 30,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                              validator: (text) =>
                                  text!.isEmpty || text.length < 3
                                      ? 'Please enter valid First Name'
                                      : null,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 30,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    validator: (text) => text!.isEmpty || text.length < 3
                        ? 'Please enter valid First Name'
                        : null,
                  ),
                ),
                abSpacing(8),
                title('Are you a driver or warehouse worker?'),
                abSpacing(8),
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    maxLength: 30,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    validator: (text) => text!.isEmpty || text.length < 3
                        ? 'Please enter valid First Name'
                        : null,
                  ),
                ),
                abSpacing(8),
                title('Your nearest location'),
                abSpacing(8),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          maxLength: 30,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                          validator: (text) => text!.isEmpty || text.length < 3
                              ? 'Please enter valid First Name'
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '?',
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 25,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(50, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        primary: MyColors.blue,
                      ),
                    ),
                  ],
                ),
                abSpacing(8),
                title('Enter your phone number'),
                abSpacing(8),
                abSpacing(16),
                Center(
                  child: Container(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buttons('Proceed'),
                        abSpacing(10),
                        buttons('Unlink Account?'),
                      ],
                    ),
                  ),
                ),
                abSpacing(16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons(String title) {
    return ElevatedButton(
      onPressed: () {
        if (title == 'Proceed') {
          // quickTempAddController.validateAndSave();
          Get.to(EnterCode());
        } else {
          Get.back();
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
}
