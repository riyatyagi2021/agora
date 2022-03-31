import 'package:agora/Ui/home/product_list_model.dart';

abstract class HomeEvent {}

class OnHomeApiHit extends HomeEvent {
  ProductListModel productListModel;
  OnHomeApiHit(this.productListModel);
}

class OnDrawerClick extends HomeEvent{
  OnDrawerClick();
}