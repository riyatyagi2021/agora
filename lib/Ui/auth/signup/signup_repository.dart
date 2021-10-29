import 'dart:convert';
import 'package:agora/Ui/auth/otp_validation/verification_model.dart';
import 'package:agora/Ui/auth/otp_validation_for%20_password/otp_model.dart';
import 'package:agora/Ui/auth/signup/signup_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class SignupRepository {

 //String userId;


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

  Future<OtpVerifyModel> otpVerify(int platform, String otpToken, String type, String email,String devTkn) async {
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

      OtpVerifyModel verificationModel = OtpVerifyModel.fromJson(jsonDecode(otpData.body));

    // print(verificationModel.res!.user!.userId.toString()+'Getting user id?');
     //var userId=verificationModel.res!.user!.userId.toString();

      //print(verificationModel.error.toString()+'---------------------------============================');
      //print("otpresponse"+resp.toString());

      return verificationModel;

    } else {
      throw Exception("Error");
    }
  }


  resendOtp(int platform, String type, String email,String devTkn)async{

    final Map<String, dynamic> resentOtp = {
      'devTkn': devTkn,
      'email': email,
      'type': type
    };

    final resentOtpData = await http.post(
        Uri.parse('https://devapi.joinaurum.com/api/v1/user/forgot/password'),
        body: resentOtp,
        headers: {
          'Authorization': 'Basic YWdvcmE6YTFnJG9yLzphLS1AYXBw',
          'platform': '1'
        });

    if(resentOtpData.statusCode==200){
      print('resent otp ' + resentOtpData.body);
    //  return resentOtpData;

      ResentOtpModel resentOtpModel=ResentOtpModel.fromJson(jsonDecode(resentOtpData.body));
      print(resentOtpModel.status.toString()+'resent otp response');
      return resentOtpModel;
    }else{
      throw Exception("There is some error");
    }

  }




}
