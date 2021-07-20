import 'package:extra_staff/utils/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';

  final localAuth = LocalAuthentication();

  Future<bool> checkAuth() async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    print(canCheckBiometrics);

    if (!canCheckBiometrics) {
      return false;
    }

    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();

    if (isiOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        print('Face ID.');
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        print('Touch ID.');
      }
    } else {
      print('Android');
    }

    try {
      bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
      print(didAuthenticate);
      return true;
    } on PlatformException catch (e) {
      print(e.message);
      return false;
    }
  }

  login() async {
    // final params = {
    //   'email': 'akash@yopmail.com',
    //   'password': '123123',
    //   'type': isiOS ? 1 : 2
    // };
    // final data = await UserModel().postUser(params);
    // print(data);
    print(email);
    print(password);
  }
}
