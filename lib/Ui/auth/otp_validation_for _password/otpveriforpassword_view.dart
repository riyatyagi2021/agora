import 'package:agora/Ui/auth/forgot_password/reset_password_view.dart';
import 'package:agora/Ui/auth/otp_validation/verification_bloc.dart';
import 'package:agora/Ui/auth/otp_validation/verification_event.dart';
import 'package:agora/Ui/auth/otp_validation/verification_state.dart';
import 'package:agora/Ui/auth/signup/signup_repository.dart';
import 'package:agora/Ui/home/home_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpVerificationPassword extends StatefulWidget {
  final emailHolder;
  const OtpVerificationPassword({Key? key, @required this.emailHolder}) : super(key: key);
  @override
  _OtpVerificationPasswordState createState() => _OtpVerificationPasswordState();
}


class _OtpVerificationPasswordState extends State<OtpVerificationPassword> {
SignupRepository signupRepository=SignupRepository();
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final VerificationBloc verificationBloc = BlocProvider.of<VerificationBloc>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: BlocConsumer<VerificationBloc, VerificationState>(
          listener: (context, state){
            if(state.isSuccess){
             print(state.isSuccess.toString()+"  Api value");
               final String? id=state.model.res?.user?.userId;
            // final String? id=state.userId;
             print("id1 "+id!);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResetPassword(idHolder:id)));
            }else if(state.isError){
              Fluttertoast.showToast(msg: "Wrong otp");
            }
          },
        builder: (context2, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Type Verification Code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please type the verification code sent to\n your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18, color: Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                            height: 100,
                            child: TextFormField(
                                onChanged: (value) {
                                  if (value.toString().isNotEmpty) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                controller: first,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                enableInteractiveSelection: false,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "0",
                                )),
                          ),
                          Container(
                            width: 60,
                            height: 100,
                            child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (value) {
                                  if (value.toString().isNotEmpty) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                controller: second,
                                enableInteractiveSelection: false,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "0",
                                )),
                          ),
                          Container(
                            width: 60,
                            height: 100,
                            child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (value) {
                                  if (value.toString().isNotEmpty) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                controller: third,
                                enableInteractiveSelection: false,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "0",
                                )),
                          ),
                          Container(
                            width: 60,
                            height: 100,
                            child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (value) {
                                  if (value.toString().isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  } else {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                controller: fourth,
                                enableInteractiveSelection: false,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  hintText: "0",
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: " Didn't receive code?   ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.5)),
                          children: [
                            TextSpan(
                              text: 'Request again',
                              style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                signupRepository.resendOtp(1, '1', widget.emailHolder, '123');
                              },
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(40, 20, 40, 15),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.green,
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        onPressed: (){
                          verificationBloc.add(OnOtpApi(first.text+second.text+third.text+fourth.text,widget.emailHolder));
                        }
                        // onPressed: ,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      )),
    );
  }


}
