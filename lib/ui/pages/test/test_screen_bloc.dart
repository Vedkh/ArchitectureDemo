import 'package:archdemo/ui/routes_config.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


abstract class TestScreenEvent{
}
abstract class TestScreenState{}

class TestScreenLoadEvent extends TestScreenEvent {
}

class TestScreenOpenSplashScreenEvent extends TestScreenEvent {
  final BuildContext context;

  TestScreenOpenSplashScreenEvent({required this.context});
}

class TestScreenInitialState extends TestScreenState {}


class TestScreenBloc extends Bloc<TestScreenEvent, TestScreenState>{
  TestScreenBloc({required TestScreenState state}) : super(state) {
    on<TestScreenLoadEvent>(
      (event, emit) async {
        emit(await _loadData(event));
      },
      transformer: sequential(), // Read https://github.com/felangel/bloc/tree/master/packages/bloc_concurrency to get more information
    );
    on<TestScreenOpenSplashScreenEvent>((event, emit) => emit(_openSplashScreen(event)));
  }

  Future<TestScreenState> _loadData(TestScreenLoadEvent event) async {


    // TODO: load user settings, add loading logic and redirect to the next screen

    return state;
  }

  TestScreenState _openSplashScreen(TestScreenOpenSplashScreenEvent event) {
    event.context.go(RoutesConfig.pathHome);
    return state;
  }

}