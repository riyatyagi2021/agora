import 'package:agora/Ui/login/login_bloc.dart';
import 'package:agora/Ui/login/login_view.dart';
import 'package:agora/Ui/signup/otp_validation/verification_bloc.dart';
import 'package:agora/Ui/signup/otp_validation/verification_view.dart';
import 'package:agora/Ui/signup/signup_bloc.dart';
import 'package:agora/Ui/signup/signup_event.dart';
import 'package:agora/Ui/signup/signup_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();


  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  // content: Text("Registration done"),
  // ));


  @override
  Widget build(BuildContext context) {
    final SignupBloc signupbloc = BlocProvider.of<SignupBloc>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state){
            print(state.isApiSuccess.toString()+'view classs api');
            if(state.isApiSuccess){
              print(state.isApiSuccess.toString()+"view classs api condition");
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Verification(emailHolder: email.text)));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BlocProvider<VerificationBloc>(
                            create: (context) =>
                                VerificationBloc(),
                            child: Verification(emailHolder:email.text),
                          )));
            }else if(state.isAPiError){
              Fluttertoast.showToast(msg: "Already registered with this username and email");
            }
          },
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.only(top: 40),
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
                            "Welcome!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ),
                        Text(
                          "Create your account!",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(50, 50, 50, 2),
                          child: TextFormField(
                            onChanged: (String fullname) {
                              signupbloc.add(FullnameEvent(fullname));
                            },
                            controller: fullname,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: "Full Name",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                hintText: "Riya Tyagi",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3))),
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(50, 30, 50, 2),
                          child: TextFormField(
                            onChanged: (String username) {
                              signupbloc.add(UsernameEvent(username));
                            },
                            keyboardType: TextInputType.text,
                            controller: username,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: "Username",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                hintText: "riya",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3))),
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(50, 30, 50, 2),
                          child: TextFormField(
                            onChanged: (String email) {
                              signupbloc.add(EmailEvent(email));
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: "Email/Phone No.",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                hintText: "Enter your email/phone no.",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3))),
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(50, 30, 50, 10),
                          child: TextFormField(
                            onChanged: (String password) {
                              signupbloc.add(PasswordEvent(password));
                            },
                            // obscureText: true,
                            controller: password,
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(' '),
                            ], //RegExp("[a-z]")
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                                hintText: "Enter your password",
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.3))),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(40, 20, 40, 15),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.green,
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            onPressed: (state.isSuccess&&
                                    state.isFullnameValid &&
                                    state.isPasswordvalid &&
                                    state.isEmailValid &&
                                    state.isUsernameValid)
                                ?()=> signupbloc.add(OnSignUpApi(fullname.text,username.text,email.text,password.text))
                                : null,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Already have an account?  ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.5)),
                              children: [
                                TextSpan(
                                  text: 'Log In',
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
                                                    create: (context) =>
                                                        LoginBloc(),
                                                    child: Login(),
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
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 80),
                          child: RichText(
                            text: TextSpan(
                                text: "    hdsmdnkmcnfbcmnmcjcbjnccjbnxk \n",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.5)),
                                children: [
                                  TextSpan(
                                    text:
                                        'terms of use & conditions & privacy policy',
                                    style: TextStyle(
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  )
                                ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
