class SignupState {
  final bool isSuccess;
  final bool isApiSuccess;
  final bool isAPiError;
  final bool isEmailValid;
  final bool isPasswordvalid;
  final bool isFullnameValid;
  final bool isUsernameValid;
  final bool isNumberValid;

  SignupState._(this.isSuccess, this.isFullnameValid, this.isUsernameValid,
      this.isEmailValid, this.isNumberValid, this.isPasswordvalid,this.isAPiError,this.isApiSuccess);


  SignupState.onFullname(SignupState state,bool isFullnameValid,bool isSuccess)
      : this._(isSuccess, isFullnameValid, state.isNumberValid, state.isEmailValid, state.isPasswordvalid, state.isUsernameValid,false,false);

  SignupState.onUsername(SignupState state,bool isFullnameValid,bool isUsernameValid,bool isSuccess)
      : this._(isSuccess, isUsernameValid, isFullnameValid, state.isNumberValid, state.isEmailValid, state.isPasswordvalid,false,false);

  SignupState.onEmail(SignupState state,bool isFullnameValid,bool isUsernameValid,bool isSuccess,bool isEmailValid)
      : this._(isSuccess, isEmailValid,isUsernameValid, isFullnameValid, state.isNumberValid,state.isPasswordvalid,false,false);

  SignupState.onPassword(SignupState state,bool isPasswordvalid,bool isFullnameValid,bool isUsernameValid,bool isSuccess,bool isEmailValid)
      : this._(true,isEmailValid,state.isNumberValid,isUsernameValid,isFullnameValid, isPasswordvalid,false,false);

  SignupState.onSignup(SignupState state, bool isSuccess)
      : this._(isSuccess, state.isFullnameValid, state.isUsernameValid,
      state.isEmailValid, state.isNumberValid, state.isPasswordvalid,false,false);


  SignupState.onApiSuccess(SignupState state,bool isApiSuccess,bool isApiFailure)
      : this._( state.isSuccess,state.isFullnameValid, state.isUsernameValid,
      state.isEmailValid, state.isNumberValid, state.isPasswordvalid,false,isApiSuccess);

  SignupState.onApiFailure(SignupState state, bool isApiSuccess,bool isApiFailure)
      : this._(state.isSuccess, state.isFullnameValid, state.isUsernameValid,
      state.isEmailValid, state.isNumberValid, state.isPasswordvalid,false,isApiFailure);

  SignupState.onInit() : this._(false, false, false, false, false, false,false,false);
}