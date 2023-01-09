import 'package:archdemo/firebase_options.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class SplashScreenEvent{}
abstract class SplashScreenState{}

class SplashScreenLoadEvent extends SplashScreenEvent {}
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
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    // TODO: load user settings, add loading logic and redirect to the next screen

    return state;
  }

}