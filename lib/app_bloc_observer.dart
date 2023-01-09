import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PokatunBlocObserver extends BlocObserver {

  @override
  void onEvent(Bloc bloc, Object? event) {
    if(null != event){
      debugPrint(event.toString());
    }
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    //debugPrint(bloc.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    //debugPrint(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc,  Object error, StackTrace stackTrace) {
    if(kDebugMode) {
      debugPrint('$error, $stackTrace');
    }
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}