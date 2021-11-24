
import 'dart:convert';

import 'package:agora/Ui/auth/login/login_repository.dart';
import 'package:agora/Ui/user_account/user_model.dart';
import 'package:http/http.dart' as http;

class UserViewRepository {

  Future<UserViewModel> userViewApi(
      int platform, String accessToken,String userId ) async {

    final UserProfileRes = await http.get(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/view/userId'),
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1',
          'accessToken': accessToken,
          'UserId': userId
        });

    if (UserProfileRes.statusCode == 200) {
      print("user profileeeee" + UserProfileRes.statusCode.toString());

      UserViewModel userViewModel = UserViewModel.fromJson(jsonDecode(UserProfileRes.body));

      print("bodyresponse" + UserProfileRes.body);
      // print('bodyresponse  ${loginModel.error.msg}');
      return userViewModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}