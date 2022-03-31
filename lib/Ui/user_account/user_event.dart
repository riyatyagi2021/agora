import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:agora/Ui/user_account/user_model.dart';

abstract class UserEvent {}

class onUserDataLoad extends UserEvent {
  UserViewModel userViewModel;
  onUserDataLoad(this.userViewModel);
}