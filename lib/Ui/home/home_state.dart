

import 'package:agora/Ui/home/home_model.dart';
import 'package:agora/Ui/home/product_list_model.dart';

class HomeState{

  final bool isSuccess;
  final bool isError;
  final  ProductListModel model;


  HomeState._(this.isSuccess,this.isError,this.model);

  HomeState.onHomeSuccess(HomeState state, bool isSuccess,bool isError, ProductListModel model)
      : this._(isSuccess,false,model);

  HomeState.onHomeFailure(HomeState state, bool isSuccess,bool isError,ProductListModel model)
      : this._(false,isError,model);

  HomeState.onInit() : this._(false, false, ProductListModel());

}