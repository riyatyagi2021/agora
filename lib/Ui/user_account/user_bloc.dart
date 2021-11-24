
import 'package:agora/Ui/user_account/user_event.dart';
import 'package:agora/Ui/user_account/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc(UserState initialState) : super(initialState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) {

    return super.mapEventToState(event);
  }


}
