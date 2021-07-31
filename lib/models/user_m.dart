import 'package:get/get_connect.dart';

class UserModel extends GetConnect {
  Future<Response> postUser(Map data) =>
      post('https://development.services.extrastaff.com/login', data,
          headers: {'lang': 'english'});
}
