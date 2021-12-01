
import 'dart:io';
import 'package:agora/BaseBloc/base_bloc.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_event.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_repo.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_state.dart';
import 'package:agora/Utils/preference_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileBloc extends BaseBloc<EditProfileEvent,EditProfileState>{
  EditProfileBloc() : super(EditProfileState.onInit());
  // HomeBloc(HomeState initialState) : super(initialState);

EditProfileRepository editProfileRepository=EditProfileRepository();
EditProfileModel editProfileModel=EditProfileModel();
String ACCESS_TOKEN="";

PreferenceUtils prefs=PreferenceUtils();

getAccessToken(){
  PreferenceUtils.getAccessToken().then((token) {
    ACCESS_TOKEN = token.toString();
    print(ACCESS_TOKEN + " access tokennnn");
  });
}

  @override
  void init() {
    super.init();
    onEditDataLoad();
  }



  @override
  Stream<EditProfileState> mapEventToState(EditProfileEvent event) async* {


  if(event is OnEditDataEvent){
     yield EditProfileState.onEditLoadData( state,false,false,editProfileModel,prefs);

  }


    if (event is OnEditApiHit) {
      var isSuccess = await onEditApi();
      if (isSuccess.status==1) {
       // yield HomeState.onHomeSuccess(state, true,false,isSuccess);
      }
      else {
        //yield HomeState.onHomeFailure(state, false,true,isSuccess);
      }
    }

  }



  File? file;

  Future<EditProfileModel> onEditApi() async {
    EditProfileModel editProfileModel = await editProfileRepository.editProfile(1, "username", ACCESS_TOKEN, file!);
    if (editProfileModel.status == 1) {
      print("EditProfile Resp value" + editProfileModel.status.toString());
      return editProfileModel;
    } else {
      //  Fluttertoast.showToast(msg: "Please try using different id");
      return throw Exception("There is something wrong");
    }
  }

 void onEditDataLoad()  {
  add(OnEditDataEvent());
  }


}
