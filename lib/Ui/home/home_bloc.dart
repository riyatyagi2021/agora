
import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/home/home_model.dart';
import 'package:agora/Ui/home/product_list_model.dart';
import 'package:agora/Ui/home/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:agora/Ui/home/home_event.dart';
import 'package:agora/Ui/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(HomeState.onInit());
 // HomeBloc(HomeState initialState) : super(initialState);

  ProductListRepository loginRepository = ProductListRepository();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnHomeApiHit) {
      var isSuccess = await onHomeApi(state);
      if (isSuccess.status==1) {
        yield HomeState.onHomeSuccess(state, true,false,isSuccess);
      }
      else {
        yield HomeState.onHomeFailure(state, false,true,isSuccess);
      }
    }
  }

  Future<ProductListModel> onHomeApi(HomeState state) async {
    ProductListModel respp = await loginRepository.productsApi("");

    if (respp.status == 1) {
      print("cvbnjhgfdxsxdcvb" + respp.status.toString());
      return respp;
    } else {
      //  Fluttertoast.showToast(msg: "Please try using different id");
      return throw Exception("There is something wrong");
    }
  }
}
