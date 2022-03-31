

import 'dart:convert';
import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';



class EditProfileRepository {


  Future<EditProfileModel> editProfile(int platform,String username, String accessToken,File image) async {
    var uri = Uri.parse("https://devapi.joinaurum.com/api/v1/user/profile");
    var request = new http.MultipartRequest("PUT", uri, );
    request.headers["accessToken"] = accessToken;
    request.headers['Authorization'] = 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw';
    request.headers['platform'] = '1';
    request.fields['username']=username;
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'img', image.path,
    );

    // add file to multipart
    request.files.add(multipartFile);

    var response = await request.send();
    print(response.stream);
    final res = await http.Response.fromStream(response);


    if(response.statusCode==200){
      print(response.statusCode);
      print(res.body+"   adsfghjk1234567890");
      EditProfileModel editProfileModel=EditProfileModel.fromJson(jsonDecode(res.body));
      print(res.body+" Edit Res body");
    return editProfileModel;
    }
    else {
    return throw Exception("There is some error");
    }
  }



  // Future<EditProfileModel> editProfileData(int platform, String accessToken) async {
  //   final Map<String, dynamic> editData = {
  //     'accessToken': accessToken,
  //   };
  //
  //   final editRes = await http.put(
  //       Uri.parse('https://devapi.joinaurum.com/api/v1/user/profile'),
  //       body: editData,
  //       headers: {
  //         'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
  //         'platform': '1'
  //       });
  //
  //   if(editRes.statusCode==200){
  //     print(editRes.statusCode);
  //     EditProfileModel editProfileModel=EditProfileModel.fromJson(jsonDecode(editRes.body));
  //     print(editRes.body);
  //     return editProfileModel;
  //   }
  //   else {
  //     return throw Exception("There is some error");
  //   }
  // }


}
