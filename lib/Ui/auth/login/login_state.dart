
import 'package:agora/Ui/auth/login/login_model.dart';

class LoginState {

  final bool isValidationSuccess;
  final bool isSuccess;
  final bool isGoogleApiSuccess;
  final bool isError;
  final bool isEmailValid;
  final  LoginModel model;
  final bool isPasswordvalid;

  LoginState._(this.isValidationSuccess, this.isEmailValid, this.isPasswordvalid,this.isSuccess,this.isError,this.isGoogleApiSuccess,this.model);

  LoginState.onEmail(LoginState state, bool isEmailValid, bool isPassword)
      : this._(state.isValidationSuccess, isEmailValid, state.isPasswordvalid,false,false,false,state.model);

  LoginState.onPassword(LoginState state, bool isPassword, bool isValidationSuccess)
      : this._(isValidationSuccess, state.isEmailValid, isPassword,false,false,false,state.model);

  LoginState.onLogin(LoginState state, bool isValidationSuccess)
      : this._(isValidationSuccess, state.isEmailValid, state.isPasswordvalid,false,false,false,state.model);


  LoginState.onLoginSuccess(LoginState state, bool isSuccess,bool isError,LoginModel model)
      : this._(state.isValidationSuccess, state.isEmailValid, state.isPasswordvalid,isSuccess,false,false,model);

  LoginState.onLoginFailure(LoginState state, bool isSuccess,bool isError,LoginModel model)
      : this._(state.isValidationSuccess, state.isEmailValid, state.isPasswordvalid,false,isError,false,model);

  LoginState.onGoogleSuccess(bool isGoogleApiSuccess,LoginState state)
      : this._(false,false,false,false,false,isGoogleApiSuccess,state.model);

  LoginState.onInit() : this._(false, false, false,false,false,false,LoginModel());

}
