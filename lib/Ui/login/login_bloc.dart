import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_model.dart';
import 'login_repository.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.onInit());
  LoginRepository loginRepository = LoginRepository();
  String devTkn = '123';

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailEvent) {
      // if(event.email.contains(RegExp('^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')))

      if (event.email.isNotEmpty &&
          event.email.contains(RegExp(
              r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$'))) {
        yield LoginState.onEmail(state, true, state.isPasswordvalid);
      } else {
        yield LoginState.onEmail(state, false, state.isPasswordvalid);
      }
    } else if (event is PasswordEvent) {
      bool passwordlength = event.password.length > 6;
      if (event.password.isNotEmpty && passwordlength) {
        yield LoginState.onPassword(state, true, state.isEmailValid);
      } else {
        yield LoginState.onPassword(state, false, state.isEmailValid);
      }
    } else if (event is OnLoginEvent) {
      yield LoginState.onLogin(state, true);
    }
    else if (event is OnLoginApiHit) {
      var isSuccess = await onLoginApi(state, event.email, event.password);
      if (isSuccess) {
        yield LoginState.onLoginSuccess(state, true,false);
      } else {
        yield LoginState.onLoginFailure(state, false,true);
      }
    }

  }
  Future<bool> onLoginApi(LoginState state, String email, String password) async {
    LoginModel respp = await loginRepository.loginApi(1, devTkn, email, password);

    if (respp.status == 1) {
      print("cvbnjhgfdxsxdcvb" + respp.status.toString());
      return true;
    } else {
      //  Fluttertoast.showToast(msg: "Please try using different id");
      return false;
    }
  }
}
