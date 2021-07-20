import 'package:get/get_connect.dart';

//Addning
class UserModel extends GetConnect {
  Future<Response> postUser(Map data) =>
      post('https://api.extrastaff.com/login', data);
}
