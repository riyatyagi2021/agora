abstract class SignupEvent {}

class FullnameEvent extends SignupEvent {
  late String fullname;

  FullnameEvent(
    this.fullname,
  );
}

class UsernameEvent extends SignupEvent {
  late String username;

  UsernameEvent(this.username);
}

class EmailEvent extends SignupEvent {
  late String email;

  EmailEvent(
    this.email,
  );
}

class NumberEvent extends SignupEvent {
  late String number;

  NumberEvent(
    this.number,
  );
}

class PasswordEvent extends SignupEvent {
  late String password;

  PasswordEvent(this.password);
}

class OnSignUp extends SignupEvent {
  late String fullname;
  late String username;
  late String email;
  late String number;
  late String password;

  OnSignUp(
      this.fullname, this.username, this.email, this.password);
}

  class OnSignUpApi extends SignupEvent {
  late String fullname;
  late String username;
  late String email;
  late String password;

  OnSignUpApi(
  this.fullname, this.username, this.email, this.password);

}
