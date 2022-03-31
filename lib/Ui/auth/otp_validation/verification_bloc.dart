
import 'package:agora/Ui/auth/otp_validation/verification_event.dart';
import 'package:agora/Ui/auth/otp_validation/verification_state.dart';
import 'package:agora/Ui/auth/otp_validation_for%20_password/otp_model.dart';
import 'package:agora/Ui/auth/signup/signup_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(VerificationState.onInit());
  SignupRepository signupRepository = SignupRepository();
  String devTkn = '123';


  @override
  Stream<VerificationState> mapEventToState(VerificationEvent event) async* {

    if (event is OnOtpApi) {
     var isSuccess = await onOtpApiHit(state, event.otp, event.email);

    // String? useridd=isSuccess.res!.user!.userId;
     //print(useridd! +" id from bloc to view");

      if (isSuccess.status==1) {
        yield VerificationState.onSuccess(state, false, true,isSuccess);
      } else {
        yield VerificationState.onSuccess(state, true, false,isSuccess);
      }
    }
  }

  Future<OtpVerifyModel> onOtpApiHit(VerificationState state, String otp,
      String emailHolder) async {
    OtpVerifyModel resp = await signupRepository.otpVerify(
        1, otp, '1', emailHolder, devTkn);

    if (resp.status == 1) {
      var id = resp.res!.user!.userId.toString();
      print("idddd " + id);
      return resp;
    } else {
      return throw Exception("There is some error");
    }
  }
}

