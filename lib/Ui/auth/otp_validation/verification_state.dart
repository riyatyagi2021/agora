import 'package:agora/Ui/auth/otp_validation_for%20_password/otp_model.dart';

class VerificationState{
  late final bool  isSuccess;
  late final bool  isError;
  late final bool  isOtpTrue;
  late final OtpVerifyModel  model;
 // late final String  userId;

  VerificationState._(this.isOtpTrue,this.isError,this.isSuccess,this.model);

  VerificationState.onSuccess(VerificationState state,bool isError,bool isSuccess,OtpVerifyModel userId):this._(state.isOtpTrue,false,isSuccess,userId);
  VerificationState.onFailure(VerificationState state,bool isError,bool isSuccess,OtpVerifyModel userId):this._(state.isOtpTrue,isError,false,userId);
  VerificationState.onInit():this._(false,false,false,OtpVerifyModel());

}