import 'package:agora/Ui/home/home_view.dart';
import 'package:agora/Ui/login/forgot_password/forgot_model.dart';
import 'package:agora/Ui/login/forgot_password/forgot_repository.dart';
import 'package:agora/Ui/login/forgot_password/otp_validation_for%20_password/otp_model.dart';
import 'package:agora/Ui/signup/signup_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../login_bloc.dart';
import '../login_view.dart';

class ResetPassword extends StatefulWidget {
  final idHolder;
  const ResetPassword({Key? key, @required this.idHolder}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController password = TextEditingController();
  SignupRepository signupRepository=SignupRepository();
 OtpVerifyModel otpVerifyModel=OtpVerifyModel();
  ForgotRepository forgotRepository=ForgotRepository();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.only(top: 100),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "agora",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.green[800]),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Reset Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
                Text(
                  "Dont't worry! We will help you",
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(0.5)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: TextFormField(
                    validator: (val) => val!.isEmpty || !val.contains("@")
                        ? "enter a valid eamil"
                        : null,
                    keyboardType: TextInputType.emailAddress,
                    controller: password,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(' '),
                    ],
                   // inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: "Enter new Password",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                        hintText: "Reset your Password",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.3))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80),
                  child: RichText(
                    text: TextSpan(
                        text: "Remember password?",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.5)),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider<LoginBloc>(
                                              create: (context) => LoginBloc(),
                                              child: Login(),
                                            ))
                                );
                              },
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 15),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.green,
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    onPressed: () {
                  resetAndgotoHome();
                    },
                    // onPressed: ,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void resetAndgotoHome() async {
   //var userId= await otpVerifyModel.res?.user?.userId.toString();
   // print("userid"+userId.toString());

    var id=widget.idHolder.toString();
        print(id+" userid value in reset view");

  // var id= signupRepository.userId;
  //  print("userid"+id.toString());

    ResetPasswordModel  resp=await forgotRepository.resetPasswordApi(1, '123',id, password.text);

    if(resp.status==1){
      print(resp.status.toString()+"nvbbcx");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home()));
    }else{
      Fluttertoast.showToast(msg: "There is some error");
    }

  }
}


