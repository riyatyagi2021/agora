
import 'package:agora/Ui/signup/signup_event.dart';
import 'package:agora/Ui/signup/signup_model.dart';
import 'package:agora/Ui/signup/signup_repository.dart';
import 'package:agora/Ui/signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState.onInit());
  SignupRepository signupRepository=SignupRepository();
  String devTkn = '123';



  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is FullnameEvent) {
      if (event.fullname.isNotEmpty && event.fullname.length > 3 && event.fullname.contains(RegExp(r'^[A-Z][a-zA-Z]{3,}(?: [A-Z][a-zA-Z]*){0,2}$'))) {
        yield SignupState.onFullname(state,true,state.isSuccess);
      } else {
        yield SignupState.onFullname(state,false,state.isSuccess);
      }
    }
    else if (event is UsernameEvent) {
      if (event.username.isNotEmpty && event.username.length > 5&&event.username.contains(RegExp(r' ^[a-zA-Z0-9]'))) {
        yield SignupState.onUsername(state,true,state.isFullnameValid,state.isSuccess);
      } else {
        yield SignupState.onUsername(state,false,state.isFullnameValid,state.isSuccess);
      }
    }

    else if (event is EmailEvent) {
      if(event.email.isNotEmpty && event.email.contains(RegExp( r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')) ){
        yield SignupState.onEmail(state,true,state.isFullnameValid,state.isUsernameValid,state.isSuccess);
      } else {
        yield SignupState.onEmail(state,false,state.isFullnameValid,state.isUsernameValid,state.isSuccess);
      }
    }

    else if (event is PasswordEvent) {
      print(state.isFullnameValid.toString()+"name");
      print(state.isUsernameValid.toString()+"usename");
      print(state.isEmailValid.toString()+"email");
      print(state.isPasswordvalid.toString()+"password");
      if (event.password.isNotEmpty && event.password.length > 6) {
        yield SignupState.onPassword(state,true,state.isFullnameValid,state.isUsernameValid,state.isEmailValid,true);
      } else {
        yield SignupState.onPassword(state,false,state.isFullnameValid,state.isUsernameValid,state.isEmailValid,false);
      }
    }
    else if (event is OnSignUp) {
      yield SignupState.onSignup(state, true);
    }

    else if(event is OnSignUpApi ){
      bool success = await onSignUpApiHit(state, event.fullname, event.username, event.email, event.password);

      print(success.toString()+'success value');

      if(success){
        print(success.toString()+'success value in if block');
        yield SignupState.onApiSuccess(state, true, false);
      }else{
        print(success.toString()+'success value in else block');
        yield SignupState.onApiSuccess(state, false, true);

      }

    }

    else {
      Fluttertoast.showToast(msg: "There is some error. Check again!");
    }
  }


  Future<bool> onSignUpApiHit(SignupState state, String fullname,
      String username, String email, String password) async {
    SignupModel resp = await signupRepository.postSignup(
        1, fullname, username, email, password, devTkn);

    print(resp.status.toString() + 'response body status');

    if (resp.status == 1) {
      print("responsestatus "+ resp.status.toString());

      return true;
    } else {
      return false;
    }
  }

}