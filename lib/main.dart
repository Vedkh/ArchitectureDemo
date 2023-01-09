import 'package:archdemo/data/repositories/factories/user_settings/user_settings_repository_factory.dart';
import 'package:archdemo/ui/constants/string_keys.dart';
import 'package:archdemo/ui/pages/splash/splash_screen.dart';
import 'package:archdemo/ui/pages/splash/splash_screen_bloc.dart';
import 'package:archdemo/ui/tools/app_localizations.dart';
import 'package:archdemo/ui/tools/build_context_settings_extension.dart';
import 'package:archdemo/ui/tools/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


Future<void> main() async {
  ThemeColors.initialize(true); // Start with light theme 
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _loadSettings(context);
    return MaterialApp( // Theming will be provided almost manually, by widgets. Only if necessary, add additional theming, minimal
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.translate(StringKeys.globalAppTitle),
      home: BlocProvider<SplashScreenBloc>(
        create: (context) => SplashScreenBloc(state: SplashScreenInitialState()),
        child: const SplashScreen(),
      ),
      supportedLocales: const [
        Locale('en')
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }

  Future<void> _loadSettings(BuildContext context) async {
    // We may do not use settings such way, TBD
    context.userSettings = await UserSettingsRepositoryFactory.createUserSettingsRepository().getUserSettings();
  }
}


