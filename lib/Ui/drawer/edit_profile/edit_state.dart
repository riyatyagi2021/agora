

import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:agora/Utils/preference_utils.dart';

class EditProfileState{
  final bool isSuccess;
  final bool isError;
  final PreferenceUtils pref;
  final  EditProfileModel model;


  EditProfileState._(this.isSuccess,this.isError,this.model,this.pref);

  EditProfileState.onEditSuccess(EditProfileState state, bool isSuccess,bool isError, EditProfileModel model,PreferenceUtils pref)
      : this._(isSuccess,false,model,pref);

  EditProfileState.onEditFailure(EditProfileState state, bool isSuccess,bool isError,EditProfileModel model,PreferenceUtils pref)
      : this._(false,isError,model,pref);

  EditProfileState.onEditLoadData(EditProfileState state, bool isSuccess,bool isError,EditProfileModel model,PreferenceUtils pref)
      : this._(false,isError,model,pref);

  EditProfileState.onInit() : this._(false, false, EditProfileModel(),PreferenceUtils());

}