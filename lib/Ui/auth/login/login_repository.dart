import 'dart:convert';

import 'package:http/http.dart' as http;

import 'login_model.dart';

class LoginRepository {
  String devTkn = '123';

  Future<LoginModel> loginApi(
      int platform, String devTkn, String email, String password) async {
    final Map<String, dynamic> login = {
      'devTkn': devTkn,
      'email': email,
      'password': password
    };
    //print("Login data" + login.toString());
    final loginRes = await http.post(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/login'),
        body: login,
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1'
        });

    if (loginRes.statusCode == 200) {
      print("loginmodel" + loginRes.statusCode.toString());

          LoginModel loginModel = LoginModel.fromJson(jsonDecode(loginRes.body));

      print("bodyresponse" + loginModel.status.toString());
      // print('bodyresponse  ${loginModel.error.msg}');
      return loginModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
