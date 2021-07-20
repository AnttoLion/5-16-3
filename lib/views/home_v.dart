import 'package:flutter/material.dart';

import 'package:extra_staff/controllers/login_c.dart';

class HomeView extends StatelessWidget {
  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        child: Text('Home'),
      ),
    );
  }
}
