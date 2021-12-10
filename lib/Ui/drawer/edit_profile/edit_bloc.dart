import 'dart:io';

import 'package:agora/BaseBloc/base_bloc.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_event.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_model.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_repo.dart';
import 'package:agora/Ui/drawer/edit_profile/edit_state.dart';
import 'package:agora/Utils/preference_utils.dart';

class EditProfileBloc extends BaseBloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileState.onInit());

  EditProfileRepository editProfileRepository = EditProfileRepository();
  EditProfileModel editProfileModel = EditProfileModel();
  String ACCESS_TOKEN = "";

  PreferenceUtils prefs = PreferenceUtils();
  //File? file;




  @override
  void init() {
    super.init();
    onEditDataLoad();
  }

  @override
  Stream<EditProfileState> mapEventToState(EditProfileEvent event) async* {
    if (event is OnEditDataEvent) {
      yield EditProfileState.onEditLoadData(
          state, false, false, editProfileModel, prefs);
    }

    if (event is OnEditApiHit) {
      var isSuccess = await onEditApi(state, event.username, event.file);
      print(isSuccess.toString()+ "  success valueeeee");
      if (isSuccess.status == 1) {
        yield EditProfileState.onEditSuccess(
            state, true, false, isSuccess, prefs);
      } else {
        yield EditProfileState.onEditFailure(
            state, false, true, isSuccess, prefs);
      }
    }
  }



  void onEditDataLoad()  {
    add(OnEditDataEvent());
  }


  Future<EditProfileModel> onEditApi(
      EditProfileState state, String username, File file) async {
    print(username.toString());

    print(file.toString());
   PreferenceUtils.getAccessToken().then((token) {
      ACCESS_TOKEN = token.toString();
      print(ACCESS_TOKEN + " access tokennnn");
    });
    print(ACCESS_TOKEN);
    EditProfileModel editProfileModel = await editProfileRepository.editProfile(
        1, username.toString(), ACCESS_TOKEN.toString(), file.absolute);
    print(ACCESS_TOKEN.toString());
    print("EditProfile Resp value" + editProfileModel.status.toString());

    if (editProfileModel.status == 1) {

      return editProfileModel;
    } else {
      return throw Exception("There is something wrong");
    }
  }


}
