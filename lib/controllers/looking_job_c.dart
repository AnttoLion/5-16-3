import 'package:get/get.dart';

class LookingJobController extends GetxController {
  final allQuestions = [
    'Able to work in the U.K?',
    'Question here?',
    'Question here?',
    'Question here?',
    'Question here?',
  ];
  final yes = 'YES';
  final no = 'NO';
  var ansValue = '';

  handleValueChanged(value) {
    ansValue = value;
  }
}
