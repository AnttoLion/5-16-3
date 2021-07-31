import 'package:extra_staff/controllers/login_c.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'enter_code_v.dart';

class LinkAccountView extends StatelessWidget {
  final LoginController loginController = LoginController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              abSpacing(32),
              Text(
                "Link Account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              title('E - mail'),
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
              abSpacing(32),
              title('Password'),
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
                  obscureText: true,
                  maxLength: 30,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () => _passwordVisible = !_passwordVisible,
                    ),
                  ),
                  validator: (text) => text!.isEmpty || text.length < 3
                      ? 'Please enter valid First Name'
                      : null,
                ),
              ),
              Spacer(),
              Spacer(),
              Center(
                child: Container(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buttons('Log In'),
                      abSpacing(32),
                      buttons('Reset log in details'),
                      abSpacing(32),
                      buttons('Go to Sign in'),
                    ],
                  ),
                ),
              ),
              abSpacing(64),
            ],
          ),
        ),
      ),
    );
  }

  Widget title(String text) {
    return Text(
      text,
      style: TextStyle(color: MyColors.grey),
    );
  }

  Widget buttons(String title) {
    return ElevatedButton(
      onPressed: () async {
        if (title == 'Log In') {
          await loginController.login();
        } else if (title == 'Reset log in details') {
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
