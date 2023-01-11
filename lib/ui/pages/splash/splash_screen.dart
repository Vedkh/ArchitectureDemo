// ignore_for_file: library_private_types_in_public_api

import 'package:archdemo/ui/constants/raster_images.dart';
import 'package:archdemo/ui/tools/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_screen_bloc.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  late SplashScreenBloc _bloc;

  _SplashScreenState() : super();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<SplashScreenBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
      buildWhen: (previous, current) => true, // TODO: add widget rebuild condition logic, if necessary
      builder: (context, state) {
        if(state is SplashScreenInitialState){
          _bloc.add(SplashScreenLoadEvent(context: context));
        }
        return Scaffold(
          body: Container(
            color: ThemeColors.primary,
            foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(RasterImages.splashScreen),
                    fit: BoxFit.fill
                )
            ),
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