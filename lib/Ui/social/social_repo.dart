import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:agora/Ui/social/social_model.dart';

class SocialRepository{

  Future<SocialVerifyModel> socialApi(
      int platform, String type,String socialId,String devTkn,String email,String name) async {
    final Map<String, dynamic> socialLogin = {
      'devTkn': devTkn,
      'email': email,
      'name': name,
      'socialId': socialId,
      'type': type,
    };


    final socialLoginResp = await http.post(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/social'),
        body: socialLogin,
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1'
        });


    if(socialLoginResp.statusCode==200){
      print("socialLoginRes " + socialLoginResp.statusCode.toString());

      SocialVerifyModel socialVerifyModel=SocialVerifyModel.fromJson(jsonDecode(socialLoginResp.body));

      return socialVerifyModel;

    }
    else{
      throw Exception ("There is something wrong");
    }

    }


}