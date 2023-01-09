import 'package:archdemo/ui/constants/colors_dark.dart';
import 'package:archdemo/ui/constants/colors_light.dart';
import 'package:flutter/material.dart';


class ThemeColors {
  static const int darkTheme = 0;
  static const int lightTheme = 1;
  static int _theme = lightTheme; // 0 - dark schema, 1 -light schema

  static MaterialColor _accent = ColorsLight.accent;
  static MaterialColor _accentDark = ColorsLight.accentDark;
  static MaterialColor _accentLight = ColorsLight.accentLight;
  static MaterialColor _accentSecondary = ColorsLight.accentSecondary;
  static MaterialColor _accentThird = ColorsLight.accentThird;
  static MaterialColor _background = ColorsLight.background;
  static MaterialColor _neutral = ColorsLight.neutral;
  static MaterialColor _neutralDark = ColorsLight.neutralDark;
  static MaterialColor _neutralLight = ColorsLight.neutralLight;
  static MaterialColor _buttonsBackgroundInactive = ColorsLight.buttonsBackgroundInactive;
  static MaterialColor _primary = ColorsLight.primary;
  static MaterialColor _primaryDark = ColorsLight.primaryDark;
  static MaterialColor _primaryLight = ColorsLight.primaryLight;
  static MaterialColor _success = ColorsLight.success;
  static MaterialColor _error = ColorsLight.error;
  static MaterialColor _notGood = ColorsLight.notGood;
  static MaterialColor _navigationLight = ColorsLight.navigationLight;
  static MaterialColor _navigationDark = ColorsLight.navigationDark;
  static MaterialColor _outlinedBorder = ColorsLight.outlinedBorder;

  static int get activeTheme => _theme;

  static MaterialColor get accent => _accent;
  static MaterialColor get accentDark => _accentDark;
  static MaterialColor get accentLight => _accentLight;
  static MaterialColor get accentSecondary => _accentSecondary;
  static MaterialColor get accentThird => _accentThird;
  static MaterialColor get background => _background;
  static MaterialColor get neutral => _neutral;
  static MaterialColor get neutralDark => _neutralDark;
  static MaterialColor get primary => _primary;
  static MaterialColor get primaryDark => _primaryDark;
  static MaterialColor get primaryLight => _primaryLight;
  static MaterialColor get neutralLight => _neutralLight;
  static MaterialColor get buttonsBackgroundInactive => _buttonsBackgroundInactive;
  static MaterialColor get success => _success;
  static MaterialColor get error => _error;
  static MaterialColor get notGood => _notGood;
  static MaterialColor get navigationLight => _navigationLight;
  static MaterialColor get navigationDark => _navigationDark;
  static MaterialColor get outlinedBorder => _outlinedBorder;


  static void initialize(bool isLightTheme) {
    _theme = isLightTheme ? lightTheme : darkTheme;
    if(darkTheme == _theme){
      applyDarkTheme();
    } else {
      applyLightTheme();
    }
  }

  static void applyDarkTheme() {
    _theme = darkTheme;
    _accent = ColorsDark.accent;
    _accentDark = ColorsDark.accentDark;
    _accentLight = ColorsDark.accentLight;
    _accentSecondary = ColorsDark.accentSecondary;
    _accentThird = ColorsDark.accentThird;
    _background = ColorsDark.background;
    _neutral = ColorsDark.neutral;
    _neutralDark = ColorsDark.neutralDark;
    _primary = ColorsDark.primary;
    _primaryDark = ColorsDark.primaryDark;
    _primaryLight = ColorsDark.primaryLight;
    _neutralLight = ColorsDark.neutralLight;
    _buttonsBackgroundInactive = ColorsDark.buttonsBackgroundInactive;
    _success = ColorsDark.success;
    _error = ColorsDark.error;
    _notGood = ColorsDark.notGood;
    _navigationLight = ColorsDark.navigationLight;
    _navigationDark = ColorsDark.navigationDark;
    _outlinedBorder = ColorsDark.outlinedBorder;
  }

  static void applyLightTheme() {
    _theme = lightTheme;
    _accent = ColorsLight.accent;
    _accentDark = ColorsLight.accentDark;
    _accentLight = ColorsLight.accentLight;
    _accentSecondary = ColorsLight.accentSecondary;
    _accentThird = ColorsLight.accentThird;
    _background = ColorsLight.background;
    _neutral = ColorsLight.neutral;
    _neutralDark = ColorsLight.neutralDark;
    _primary = ColorsLight.primary;
    _primaryDark = ColorsLight.primaryDark;
    _primaryLight = ColorsLight.primaryLight;
    _neutralLight = ColorsLight.neutralLight;
    _buttonsBackgroundInactive = ColorsLight.buttonsBackgroundInactive;
    _success = ColorsLight.success;
    _error = ColorsLight.error;
    _notGood = ColorsLight.notGood;
    _navigationLight = ColorsLight.navigationLight;
    _navigationDark = ColorsLight.navigationDark;
    _outlinedBorder = ColorsLight.outlinedBorder;
  }

}