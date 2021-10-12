
class LoginState {

  final bool isValidationSuccess;
  final bool isSuccess;
  final bool isError;
  final bool isEmailValid;
  final bool isPasswordvalid;

  LoginState._(this.isValidationSuccess, this.isEmailValid, this.isPasswordvalid,this.isSuccess,this.isError);

  LoginState.onEmail(LoginState state, bool isEmailValid, bool isPassword)
      : this._(state.isValidationSuccess, isEmailValid, state.isPasswordvalid,false,false);

  LoginState.onPassword(LoginState state, bool isPassword, bool isValidationSuccess)
      : this._(isValidationSuccess, state.isEmailValid, isPassword,false,false);

  LoginState.onLogin(LoginState state, bool isValidationSuccess)
      : this._(isValidationSuccess, state.isEmailValid, state.isPasswordvalid,false,false);


  LoginState.onLoginSuccess(LoginState state, bool isSuccess,bool isError)
      : this._(state.isValidationSuccess, state.isEmailValid, state.isPasswordvalid,isSuccess,false);

  LoginState.onLoginFailure(LoginState state, bool isSuccess,bool isError)
      : this._(state.isValidationSuccess, state.isEmailValid, state.isPasswordvalid,false,isError);

  LoginState.onInit() : this._(false, false, false,false,false);

}
