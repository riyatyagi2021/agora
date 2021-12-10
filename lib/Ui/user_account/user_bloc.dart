
import 'package:agora/BaseBloc/base_bloc.dart';
import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_repo.dart';
import 'package:agora/Ui/user_account/user_account_repo.dart';
import 'package:agora/Ui/user_account/user_event.dart';
import 'package:agora/Ui/user_account/user_model.dart';
import 'package:agora/Ui/user_account/user_state.dart';
import 'package:agora/Utils/preference_utils.dart';

class UserBloc extends BaseBloc<UserEvent,UserState>{
  UserBloc() : super(UserState.onInit());

UserViewRepository userViewRepository=UserViewRepository();
UserViewModel userViewModel=UserViewModel();
PreferenceUtils preferenceUtils=PreferenceUtils();
  LoginModel loginModel=LoginModel();
  String ACCESS_TOKEN = "";
  String USER_ID = "";

  @override
  void init() {
    super.init();
    onUserDataApi();
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
    if(event is onUserDataLoad){
      if (event.userViewModel.status == 1) {
        yield UserState.onUserSuccess(true, false, userViewModel, preferenceUtils, loginModel);
      }else{
        yield UserState.onUserFailure(false, true, userViewModel, preferenceUtils, loginModel);
      }

    }

  }

  void onUserDataApi() async {
    try {
      PreferenceUtils.getAccessToken().then((token) {
        ACCESS_TOKEN = token.toString();
        print(ACCESS_TOKEN + " access tokennnn");
      });
      PreferenceUtils.getUserProfile().then((value){
        USER_ID=value.userId.toString();
        print("useridddddddddddddd"+ USER_ID);
      } );


      UserViewModel userViewModel=await userViewRepository.userViewApi(1, ACCESS_TOKEN.toString(), USER_ID.toString());

      print("User adata resposneee" + userViewModel.status.toString());
      add(onUserDataLoad(userViewModel));

    } catch(e) {
      print("There is something wrong");
    }
  }


}
