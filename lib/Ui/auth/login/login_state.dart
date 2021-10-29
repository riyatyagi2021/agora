
class LoginState {

  final bool isValidationSuccess;
  final bool isSuccess;
  final bool isGoogleApiSuccess;
  final bool isError;
  final bool isEmailValid;
  final bool isPasswordvalid;

  LoginState._(this.isValidationSuccess, this.isEmailValid, this.isPasswordvalid,this.isSuccess,this.isError,this.isGoogleApiSuccess);

  LoginState.onEmail(LoginState state, bool isEmailValid, bool isPassword)
      : this._(state.isValidationSuccess, isEmailValid, state.isPasswordvalid,false,false,false);

  LoginState.onPassword(LoginState state, bool isPassword, bool isValidationSuccess)
      : this._(isValidationSuccess, state.isEmailValid, isPassword,false,false,false);

  LoginState.onLogin(LoginState state, bool isValidationSuccess)
      : this._(isValidationSuccess, state.isEmailValid, state.isPasswordvalid,false,false,false);


  LoginState.onLoginSuccess(LoginState state, bool isSuccess,bool isError)
      : this._(state.isValidationSuccess, state.isEmailValid, state.isPasswordvalid,isSuccess,false,false);

  LoginState.onLoginFailure(LoginState state, bool isSuccess,bool isError)
      : this._(state.isValidationSuccess, state.isEmailValid, state.isPasswordvalid,false,isError,false);

  LoginState.onGoogleSuccess(bool isGoogleApiSuccess)
      : this._(false,false,false,false,false,isGoogleApiSuccess);

  LoginState.onInit() : this._(false, false, false,false,false,false);

}
