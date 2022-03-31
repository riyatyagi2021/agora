import 'package:flutter_bloc/flutter_bloc.dart';


abstract class BaseBloc<Event, BaseState> extends Bloc<Event, BaseState> {
  void init() {}
  BaseBloc(BaseState initialState) : super(initialState) {
   init();
  }

  @override
  Future<void> onError(Object error, StackTrace stackTrace) async {
    super.onError(error, stackTrace);
  }
}