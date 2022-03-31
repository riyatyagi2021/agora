import 'package:agora/BaseBloc/base_bloc.dart';
import 'package:agora/Ui/auth/login/login_model.dart';
import 'package:agora/Ui/home/home_event.dart';
import 'package:agora/Ui/home/home_state.dart';
import 'package:agora/Ui/home/product_list_model.dart';
import 'package:agora/Ui/home/products_repository.dart';
import 'package:agora/Utils/preference_utils.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeState.onInit());

  PreferenceUtils preferenceUtils=PreferenceUtils();
  LoginModel  loginModel=LoginModel();

  ProductListRepository productListRepository = ProductListRepository();

  @override
  void init() {
    super.init();
    onHomeApi();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnHomeApiHit) {
      if (event.productListModel.status == 1) {
        print("${loginModel.res?.user?.name.toString()} value");
        yield HomeState.onHomeSuccess( true, false, productListRepository,event.productListModel,preferenceUtils,loginModel);
      } else {
        yield HomeState.onHomeFailure(false, true, productListRepository, event.productListModel,preferenceUtils,loginModel);
      }
    }

  }

     void onHomeApi() async {
    try {

    ProductListModel productListModel = await productListRepository.productsApi("");

      print("ProductList Resp value" + productListModel.status.toString());
      add(OnHomeApiHit(productListModel));

    } catch(e) {
       print("There is something wrong");
    }
  }

}
