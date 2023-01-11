import 'package:archdemo/ui/pages/splash/splash_screen.dart';
import 'package:archdemo/ui/pages/splash/splash_screen_bloc.dart';
import 'package:archdemo/ui/pages/test/test_screen.dart';
import 'package:archdemo/ui/pages/test/test_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class RoutesConfig {
  static const String pathHome = "/";
  static const String pathTest = "/test";

  static GoRouter getRoutes(){
    return GoRouter(
      routes: [
        GoRoute(
          path: pathHome,
          builder: (context, state) => BlocProvider<SplashScreenBloc>(
            create: (context) => SplashScreenBloc(state: SplashScreenInitialState()),
            child: const SplashScreen(),
          ),
        ),
        GoRoute(
          path: pathTest,
          builder: (context, state) => BlocProvider<TestScreenBloc>(
            create: (context) => TestScreenBloc(state: TestScreenInitialState()),
            child: const TestScreen(),
          ),
        ),
      ]
    );
  }
}