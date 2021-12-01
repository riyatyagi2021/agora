
import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/home/product_list_model.dart';
import 'package:agora/Ui/home/products_repository.dart';
import 'package:agora/Utils/preference_utils.dart';

class HomeState{
  final bool isSuccess;
  final bool isError;
  final ProductListRepository repository;
  final PreferenceUtils prefUtils;
  final LoginModel loginModel;
  final  ProductListModel model;


  HomeState._(this.isSuccess,this.isError,this.repository,this.model,this.prefUtils,this.loginModel);

  HomeState.onHomeSuccess( bool isSuccess,bool isError,ProductListRepository repository,ProductListModel model,PreferenceUtils preferenceUtils,LoginModel loginModel)
      : this._(isSuccess,false,repository,model,preferenceUtils,loginModel);

  HomeState.onHomeFailure( bool isSuccess,bool isError,ProductListRepository repository,ProductListModel model,PreferenceUtils preferenceUtils,LoginModel loginModel)
      : this._(false,isError,repository,model,preferenceUtils,loginModel);

  HomeState.onInit() : this._(false, false, ProductListRepository(),ProductListModel(),PreferenceUtils(),LoginModel());

}