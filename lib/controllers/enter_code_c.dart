import 'package:get/get_state_manager/get_state_manager.dart';

class EnterCodeController extends GetxController {
  String otp = '    ';

  bool addOtp(int key, String str) {
    final strn = str == '' ? ' ' : str;
    otp = replaceCharAt(otp, key, strn);
    final value = otp.replaceAll(' ', '');
    return value.isNotEmpty && value.length == 4;
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }
}
