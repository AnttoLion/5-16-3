import 'package:extra_staff/views/enter_code_v.dart';
import 'package:extra_staff/views/looking_job_v.dart';
import 'package:extra_staff/views/already_signedup_v.dart';

import 'package:get/get.dart';

class WelcomeController extends GetxController {
  lookingForAJob() {
    Get.to(LookingForAJob());
  }

  alreadySignedUp() {
    Get.to(AlreadySignedUp());
  }

  enterCode() {
    Get.to(EnterCode());
  }
}
