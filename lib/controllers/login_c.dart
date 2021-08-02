import 'package:extra_staff/models/user_m.dart';
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

  Future<String> login() async {
    final params = {
      'email': 'admin@efos.com',
      'password': 'gip89Gih',
      'type': isiOS ? 1 : 2
    };
    final data = await UserModel().postUser(params);
    // final response = {
    //   "errorCode": 0,
    //   "errorMessage": "",
    //   "result": {
    //     "session_id": "G9pFWyh6IkmNtLnjsbUc37uRJEBKr8aSfDeZ41QvH20TPXAV",
    //     "userid": 11
    //   }
    // };
    final response = data as Map<String, Object>;
    if (response['errorCode'] == 0) {
      print(data);
      print(email);
      print(password);
      return '';
    } else {
      print('Handle error');
      return response['errorMessage'] as String;
    }
  }
}
