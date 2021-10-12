import 'package:agora/Ui/signup/otp_validation/verification_event.dart';
import 'package:agora/Ui/signup/otp_validation/verification_model.dart';
import 'package:agora/Ui/signup/otp_validation/verification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../signup_repository.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(VerificationState.onInit());
  SignupRepository signupRepository = SignupRepository();
  String devTkn = '123';



  @override
  Stream<VerificationState> mapEventToState(VerificationEvent event) async* {


    if(event is OnOtpApi) {
      var isSuccess = await onOtpApiHit(state, event.otp, event.email);

      if (isSuccess) {
        yield VerificationState.onSuccess(state, false, true);
      } else {
        yield VerificationState.onSuccess(state, true, false);
      }
    }

  }

  Future<bool> onOtpApiHit(VerificationState state,String otp,String emailHolder) async{

    VerificationModel resp = await signupRepository.otpVerify(1,otp, '1',emailHolder, devTkn);
    if (resp.status == 1) {

      return true;
    } else {
      return false;    }
  }

}