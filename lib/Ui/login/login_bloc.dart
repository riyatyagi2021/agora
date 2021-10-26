import 'package:agora/Ui/social/social_model.dart';
import 'package:agora/Ui/social/social_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_event.dart';
import 'login_model.dart';
import 'login_repository.dart';
import 'login_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.onInit());
  LoginRepository loginRepository = LoginRepository();
  String devTkn = '123';
  FirebaseAuth auth=FirebaseAuth.instance;
  GoogleSignIn googleSignIn=GoogleSignIn();
SocialRepository socialRepository=SocialRepository();



  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailEvent) {
      // if(event.email.contains(RegExp('^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')))

      if (event.email.isNotEmpty &&
          event.email.contains(RegExp(
              r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'))) {
        yield LoginState.onEmail(state, true, state.isPasswordvalid);
      } else {
        yield LoginState.onEmail(state, false, state.isPasswordvalid);
      }
    }
    else if (event is PasswordEvent) {
      bool passwordlength = event.password.length > 6;
      if (event.password.isNotEmpty && passwordlength) {
        yield LoginState.onPassword(state, true, state.isEmailValid);
      } else {
        yield LoginState.onPassword(state, false, state.isEmailValid);
      }
    }
    else if (event is OnLoginEvent) {
      yield LoginState.onLogin(state, true);
    }
    else if (event is OnLoginApiHit) {
      var isSuccess = await onLoginApi(state, event.email, event.password);
      if (isSuccess) {
        yield LoginState.onLoginSuccess(state, true,false);
      }
      else {
        yield LoginState.onLoginFailure(state, false,true);
      }
    }

    else if(event is OnLoginWithGoogle){

     var isGoogleSuccess=await onGoogleApiHit();
     print("google Res "+isGoogleSuccess.status.toString());
      if(isGoogleSuccess.status==1){

        print("google Reshjgfdsdfgbnm "+isGoogleSuccess.status.toString());

        yield LoginState.onGoogleSuccess(true);
      }
      else{
        yield LoginState.onGoogleSuccess(false);
      }
    }

  }


  Future<User?>  signInWithGoogle() async{
    GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();
    GoogleSignInAuthentication gsa=await googleSignInAccount!.authentication;



    OAuthCredential credential=GoogleAuthProvider.credential(
        accessToken: gsa.accessToken,
        idToken:gsa.idToken
    );

    UserCredential authResult=await auth.signInWithCredential(credential);

    User?  userInfo=await authResult.user;
    print("Username: ${userInfo!.displayName}");
    print("Email: ${userInfo!.email}");
    print("UserId: ${userInfo!.uid}");
    return userInfo;

  }


  Future<SocialVerifyModel> onGoogleApiHit() async {
    String? token =await FirebaseMessaging.instance.getToken();

  User? a=await signInWithGoogle();

    SocialVerifyModel resp = await socialRepository.socialApi(1,'2', a!.uid, token!,a.email ?? '',a.displayName?? '');

    if (resp.status == 1) {
      return resp;
    } else {
      return throw Exception("There is some error");
    }
  }


  Future<bool> onLoginApi(LoginState state, String email, String password) async {
    LoginModel respp = await loginRepository.loginApi(1, devTkn, email, password);

    if (respp.status == 1) {
      print("cvbnjhgfdxsxdcvb" + respp.status.toString());
      return true;
    } else {
      //  Fluttertoast.showToast(msg: "Please try using different id");
      return false;
    }
  }


}
