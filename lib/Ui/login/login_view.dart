import 'package:agora/Ui/home/home_view.dart';
import 'package:agora/Ui/login/forgot_password/forgot_password_view.dart';
import 'package:agora/Ui/login/login_event.dart';
import 'package:agora/Ui/signup/signup_bloc.dart';
import 'package:agora/Ui/signup/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_bloc.dart';
import 'login_state.dart';

final themeColor = new Color(0xfff5a623);

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginbloc = BlocProvider.of<LoginBloc>(context);

    return GestureDetector(
      child: Scaffold(
          body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            isLoading = false;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          } else if (state.isError) {
            isLoading = false;
            Fluttertoast.showToast(msg: "Check email and password");
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.only(top: 80),
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
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                "Welcome Back!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              "Login to your account!",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black.withOpacity(0.5)),
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  margin: EdgeInsets.fromLTRB(50, 50, 50, 2),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(50, 50, 50, 2),
                                    padding: EdgeInsets.all(14),
                                    width: 260,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      border:
                                          Border.all(color: Colors.grey, width: 2.0),
                                    ),
                                    child: TextField(
                                      controller: email,
                                      onChanged: (String email) =>
                                          loginbloc.add(EmailEvent(email)),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Enter your email",
                                          hintStyle: TextStyle(
                                              color: Colors.black.withOpacity(0.3))),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 40,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(70, 50, 50, 2),
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Icon(Icons.email,
                                              color: Colors.green, size: 20),
                                          Text(
                                            ' Email Address',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )
                                        ],
                                      )),
                                )
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  margin: EdgeInsets.fromLTRB(50, 10, 50, 2),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(50, 10, 50, 2),
                                    padding: EdgeInsets.all(14),
                                    width: 260,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      border:
                                          Border.all(color: Colors.grey, width: 2.0),
                                    ),
                                    child: TextField(
                                      controller: password,
                                      onChanged: (String password) =>
                                          loginbloc.add(PasswordEvent(password)),
                                      //obscureText:  true ,//_obscureText
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(' '),
                                      ], //RegExp("[a-z]")
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Enter your password",
                                          hintStyle: TextStyle(
                                              color: Colors.black.withOpacity(0.3))),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 40,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(70, 50, 50, 2),
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Icon(Icons.lock,
                                              color: Colors.green, size: 20),
                                          Text(
                                            ' Password',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          )
                                        ],
                                      )),
                                )
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 120, top: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ForgotPassword()));
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                )),
                            Center(
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.fromLTRB(40, 40, 40, 15),
                                child: RaisedButton(
                                  elevation: 5,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  color: Colors.green,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  onPressed: (state.isValidationSuccess &&
                                      state.isEmailValid &&
                                      state.isPasswordvalid)
                                      ? () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    loginbloc.add(OnLoginApiHit(
                                        email.text, password.text));
                                  }
                                      : null,
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Don't have an account?  ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.5)),
                                  children: [
                                    TextSpan(
                                      text: 'Register',
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
                                                      BlocProvider<SignupBloc>(
                                                        create: (context) =>
                                                            SignupBloc(),
                                                        child: SignUp(),
                                                      )));
                                        },
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "G",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: 50,
                                    height: 50,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "f",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              isLoading ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                  ),
                ),
                color: Colors.green.shade50.withOpacity(0.8),
              ) :Container()

            ],
          );
        },
      )),
    );
  }
}
