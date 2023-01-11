// ignore_for_file: library_private_types_in_public_api

import 'package:archdemo/ui/constants/string_keys.dart';
import 'package:archdemo/ui/tools/app_localizations.dart';
import 'package:archdemo/ui/tools/app_text_styles.dart';
import 'package:archdemo/ui/tools/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'test_screen_bloc.dart';


class TestScreen extends StatefulWidget {

  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}


class _TestScreenState extends State<TestScreen> {
  late TestScreenBloc _bloc;

  _TestScreenState() : super();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<TestScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestScreenBloc, TestScreenState>(
      buildWhen: (previous, current) => true, // TODO: add widget rebuild condition logic, if necessary
      builder: (context, state) {
        if(state is TestScreenInitialState){
          _bloc.add(TestScreenLoadEvent());
        }
        return Scaffold(
          body: SafeArea(
            child: InkWell(
              onTap: () => _bloc.add(TestScreenOpenSplashScreenEvent(context: context)),
              child: Container(
                color: ThemeColors.background,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.translate(StringKeys.globalAppTitle),
                    style: AppTextStyles.normalTextLightBackground,
                  ),
                ),
              ),
            )
          ),
        );
      },
    );
  }

  @override
  void dispose(){
    _bloc.close();
    super.dispose();
  }
}