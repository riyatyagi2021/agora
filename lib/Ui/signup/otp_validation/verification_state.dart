class VerificationState{
  late final bool  isSuccess;
  late final bool  isError;
  late final bool  isOtpTrue;

  VerificationState._(this.isOtpTrue,this.isError,this.isSuccess);

  VerificationState.onSuccess(VerificationState state,bool isError,bool isSuccess):this._(state.isOtpTrue,false,isSuccess);
  VerificationState.onFailure(VerificationState state,bool isError,bool isSuccess):this._(state.isOtpTrue,isError,false);
  VerificationState.onInit():this._(false,false,false);

}