import 'package:extra_staff/views/choose_password.dart';
import 'package:extra_staff/views/forogt_password.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BiometricView extends StatelessWidget {
  const BiometricView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BiometricView'),
      ),
      body: Column(
        children: [
          TextButton(
            child: Text('BiometricView'),
            onPressed: () {
              Get.to(ChoosePassword());
            },
          ),
          TextButton(
            child: Text('ForgorPassword'),
            onPressed: () {
              Get.to(ForogtPassword());
            },
          ),
        ],
      ),
    );
  }
}
