import 'package:agora/Ui/auth/login/login_bloc.dart';
import 'package:agora/Ui/auth/login/login_view.dart';
import 'package:agora/Ui/auth/otp_validation/verification_bloc.dart';
import 'package:agora/Ui/auth/otp_validation/verification_model.dart';
import 'package:agora/Ui/auth/otp_validation_for%20_password/otpveriforpassword_view.dart';
import 'package:agora/Ui/auth/signup/signup_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  SignupRepository signupRepository=SignupRepository();

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
                  "Forgot Password",
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
                    controller: email,
                    decoration: InputDecoration(

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: "Email Address",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                        hintText: "Enter your email",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.3))
                    ),
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
                      otpvalidationScreen();
                     // signupRepository.resendOtp(1, '1', email.text, '123');
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

  void otpvalidationScreen() async{
  ResentOtpModel success=  await signupRepository.resendOtp(1, '1', email.text, '123');

  if(success.status==1){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                BlocProvider<VerificationBloc>(
                  create: (context) =>
                      VerificationBloc(),
                  child: OtpVerificationPassword(emailHolder:email.text),
                )));

  }

  }
}


