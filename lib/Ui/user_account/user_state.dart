
import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:agora/Ui/home/product_list_model.dart';
import 'package:agora/Ui/home/products_repository.dart';
import 'package:agora/Ui/user_account/user_model.dart';
import 'package:agora/Utils/preference_utils.dart';

class UserState{
  final bool isSuccess;
  final bool isError;
  final UserViewModel userViewModel ;
  final PreferenceUtils prefUtils;
  final LoginModel loginModel;


  UserState._(this.isSuccess,this.isError,this.userViewModel,this.prefUtils,this.loginModel);

  UserState.onUserSuccess( bool isSuccess,bool isError,UserViewModel userViewModel,PreferenceUtils preferenceUtils,LoginModel loginModel)
      : this._(isSuccess,false,userViewModel,preferenceUtils,loginModel);

  UserState.onUserFailure( bool isSuccess,bool isError,UserViewModel userViewModel,PreferenceUtils preferenceUtils,LoginModel loginModel)
      : this._(false,isError,userViewModel,preferenceUtils,loginModel);

  UserState.onInit() : this._(false, false,UserViewModel(),PreferenceUtils(),LoginModel());

}