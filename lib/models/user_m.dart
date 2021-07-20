import 'package:get/get_connect.dart';

//Addning Class Commit
class UserModel extends GetConnect {
  Future<Response> postUser(Map data) =>
      post('https://api.extrastaff.com/login', data);
}
