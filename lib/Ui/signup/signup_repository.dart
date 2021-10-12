import 'dart:convert';
import 'package:agora/Ui/signup/signup_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'otp_validation/verification_model.dart';

class SignupRepository {
 Future postSignup(int platform, String name, String username, String email,
      String password,String devTkn) async {

    final Map<String, dynamic> apiBodyData = {
      'devTkn': devTkn,
      'name': name,
      'username': username,
      'email': email,
      'password': password
    };
    final signupData = await http.post(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/signup'),
        body: apiBodyData,
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1'
        });

    if (signupData.statusCode == 200) {
     print('signupvalidation   ' + signupData.body.toString());

      SignupModel signupModel=SignupModel.fromJson(jsonDecode(signupData.body));
      print(signupModel.status.toString()+'---------------------------============================');

      return signupModel;

    } else {
      Fluttertoast.showToast(msg: "There is some error");
    }
  }

  Future<VerificationModel> otpVerify(int platform, String otpToken, String type, String email,String devTkn) async {
    final Map<String, dynamic> otp = {
      'devTkn': devTkn,
      'otp': otpToken,
      'email': email,
      'type': type
    };
  final otpData = await http.post(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/verify/otp'),
        body: otp,
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1'
        });

    if (otpData.statusCode == 200) {
     // print('otp  ' + otpData.body);
     // final resp =  jsonDecode(otpData.body);

      VerificationModel verificationModel = VerificationModel.fromJson(jsonDecode(otpData.body));

     print(verificationModel.status.toString()+'---------------------------============================');
      //print(verificationModel.error.toString()+'---------------------------============================');
      //print("otpresponse"+resp.toString());

      return verificationModel;

    } else {
      throw Exception("Error");
    }
  }





}
