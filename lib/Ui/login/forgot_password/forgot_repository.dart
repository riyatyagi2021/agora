import 'dart:convert';
import 'package:http/http.dart' as http;
import 'forgot_model.dart';

class ForgotRepository {


  Future<ResetPasswordModel> resetPasswordApi(int platform, String devTkn, String userid, String password) async {

    final Map<String, dynamic> resetPassword = {
      'devTkn': devTkn,
      'userId': userid,
      'password': password
    };

    print("jhvbnm"+resetPassword.toString());
    final resetPasswordRes = await http.post(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/reset/password'),
        body: resetPassword,
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1'
        });

    if (resetPasswordRes.statusCode == 200) {
      print("resetpasswordmodel response" + resetPasswordRes.statusCode.toString());

      ResetPasswordModel resetPasswordModel =
          ResetPasswordModel.fromJson(jsonDecode(resetPasswordRes.body));
      // print("bodyresponse"+resetPasswordModel.status.toString());
      // print('bodyresponse  ${resetPasswordModel.error.msg}');
      return resetPasswordModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
