
import 'dart:convert';

import 'package:agora/Ui/drawer/drawer_model.dart';
import 'package:http/http.dart' as http;

class UserViewRepository {
  String devTkn = '123';

  Future<UserViewModel> userViewApi(
      int platform, String accessToken,String userId ) async {
    final Map<String, dynamic> userProfile= {
      'accessToken': accessToken,
      'UserId': userId
    };
    print("jhvbnm" + userProfile.toString());
    final UserProfileRes = await http.post(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/view/userId'),
        body: userProfile,
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1'
        });

    if (UserProfileRes.statusCode == 200) {
      print("user profileeeee" + UserProfileRes.statusCode.toString());

      UserViewModel userViewModel = UserViewModel.fromJson(jsonDecode(UserProfileRes.body));

      print("bodyresponse" + userViewModel.status.toString());
      // print('bodyresponse  ${loginModel.error.msg}');
      return userViewModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}