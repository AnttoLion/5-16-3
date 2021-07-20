import 'package:extra_staff/controllers/login_c.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:extra_staff/views/home_v.dart';
import 'package:flutter/material.dart';

import 'package:extra_staff/utils/ab.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = LoginController();

  TextField abTextField(String placeholder, Function(String) onChange) {
    return TextField(
      onChanged: (text) => onChange(text),
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: placeholder,
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) {
                    loginController.email = text;
                    loginController.update();
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                abSpacing(16),
                TextField(
                  onChanged: (text) {
                    loginController.password = text;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                GetBuilder<LoginController>(
                    init: loginController,
                    builder: (controller) {
                      return TextField(
                        onChanged: (text) {
                          print(controller.password);
                        },
                        decoration: InputDecoration(
                          hintText: controller.email,
                          labelText: controller.email,
                          border: OutlineInputBorder(),
                        ),
                      );
                    }),
                abSpacing(16),
                TextButton(
                  onPressed: () async => await loginController.login(),
                  child: Container(
                    color: Theme.of(context).accentColor,
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    // final value = await loginController.checkAuth();
                    // print(value);
                    Get.to(HomeView());
                  },
                  child: Container(
                    color: Theme.of(context).accentColor,
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Login with Biomatric',
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
