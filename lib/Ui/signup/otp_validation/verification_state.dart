class VerificationState{
  late final bool  isSuccess;
  late final bool  isError;
  late final bool  isOtpTrue;
  late final String  userId;

  VerificationState._(this.isOtpTrue,this.isError,this.isSuccess,this.userId);

  VerificationState.onSuccess(VerificationState state,bool isError,bool isSuccess,String userId):this._(state.isOtpTrue,false,isSuccess,userId);
  VerificationState.onFailure(VerificationState state,bool isError,bool isSuccess,String userId):this._(state.isOtpTrue,isError,false,userId);
  VerificationState.onInit():this._(false,false,false," ");

}