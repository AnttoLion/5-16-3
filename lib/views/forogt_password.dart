import 'package:extra_staff/views/enter_code_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForogtPassword extends StatelessWidget {
  const ForogtPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password'),
      ),
      body: Container(
        child: InkWell(
          child: Text('Fogot Password'),
          onTap: () {
            Get.to(EnterCode());
          },
        ),
      ),
    );
  }
}
