abstract class VerificationEvent {}

class OnOtpEvent extends VerificationEvent{
  late String otp;
  OnOtpEvent(this.otp);
}
class OnOtpApi extends VerificationEvent{
  late String otp;
  late String email;
  OnOtpApi(this.otp, this.email);

}