import 'package:extra_staff/views/choose_password.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegistrationView'),
      ),
      body: Column(
        children: [
          TextButton(
            child: Text('RegistrationView'),
            onPressed: () {
              Get.to(ChoosePassword());
            },
          ),
          TextButton(
            child: Text('Choose passcode'),
            onPressed: () {
              Get.to(ChoosePassword());
            },
          ),
        ],
      ),
    );
  }
}
