import 'package:archdemo/ui/routes_config.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


abstract class SplashScreenEvent{}
abstract class SplashScreenState{}

class SplashScreenLoadEvent extends SplashScreenEvent {
  final BuildContext context;

  SplashScreenLoadEvent({required this.context});
}

class SplashScreenInitialState extends SplashScreenState {}

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState>{
  SplashScreenBloc({required SplashScreenState state}) : super(state) {
    on<SplashScreenLoadEvent>(
      (event, emit) async {
        emit(await _loadData(event));
      },
      transformer: sequential(), // Read https://github.com/felangel/bloc/tree/master/packages/bloc_concurrency to get more information
    );
  }

  Future<SplashScreenState> _loadData(SplashScreenLoadEvent event) async {
    /*await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);*/


    // TODO: load user settings, add loading logic and redirect to the next screen

    Future.delayed(const Duration(seconds: 5)).then((value) => _openTestPage(event.context));

    return state;
  }

  void _openTestPage(BuildContext context){
    context.push(RoutesConfig.pathTest);
  }
}