import 'package:archdemo/ui/constants/widgets_settings.dart';
import 'package:flutter/material.dart';
import 'theme_colors.dart';


class AppTextStyles {
  static TextStyle get appBarTitle => TextStyle(
    color: ThemeColors.neutralLight,
    fontSize: WidgetsSettings.fontSizeSubtitles,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get appBarSubtitle => TextStyle(
    color: ThemeColors.neutralLight,
    fontSize: WidgetsSettings.fontSizeNormal,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );


  static TextStyle get buttonsLightBackground => TextStyle(
    color: ThemeColors.neutralDark,
    fontSize: WidgetsSettings.fontSizeButtons,
    fontWeight: FontWeight.normal,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle get buttonsDarkBackground => buttonsLightBackground.copyWith(color: ThemeColors.neutralLight);

  static TextStyle get subtitleLightBackground => TextStyle(
    color: ThemeColors.neutralDark,
    fontSize: WidgetsSettings.fontSizeSubtitles,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle get subtitleDarkBackground => subtitleLightBackground.copyWith(color: ThemeColors.neutralLight);

  static TextStyle get titleLightBackground => TextStyle(
    color: ThemeColors.neutralDark,
    fontSize: WidgetsSettings.fontSizeTitles,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle get titleDarkBackground => titleLightBackground.copyWith(color: ThemeColors.neutralLight);


  static TextStyle get fieldTitleLightBackground => TextStyle(
    color: ThemeColors.neutralDark,
    fontSize: WidgetsSettings.fontSizeNormal,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get fieldTitleDarkBackground => fieldTitleLightBackground.copyWith(color: ThemeColors.neutralLight);

  static TextStyle get fieldTextLightBackground => TextStyle(
    color: ThemeColors.neutralDark,
    fontSize: WidgetsSettings.fontSizeNormal,
    fontWeight: FontWeight.normal,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle get fieldTextDarkBackground => fieldTextLightBackground.copyWith(color: ThemeColors.neutralLight);

  static TextStyle get fieldHintTextLightBackground => fieldTextLightBackground.copyWith(color: ThemeColors.neutralDark[500]);
  static TextStyle get fieldHintTextDarkBackground => fieldHintTextLightBackground.copyWith(color: ThemeColors.neutralLight[500]);

  static TextStyle get fieldErrorTextLightBackground => TextStyle(
    color: ThemeColors.accentSecondary,
    fontSize: WidgetsSettings.fontSizeSmall,
    fontWeight: FontWeight.normal,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle get fieldErrorTextDarkBackground => fieldErrorTextLightBackground;

  static TextStyle get normalTextLightBackground => TextStyle(
    color: ThemeColors.neutralDark,
    fontSize: WidgetsSettings.fontSizeNormal,
    fontWeight: FontWeight.normal,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle get normalTextDarkBackground => normalTextLightBackground.copyWith(color: ThemeColors.neutralLight);

  static TextStyle get smallTextLightBackground => TextStyle(
    color: ThemeColors.neutralDark,
    fontSize: WidgetsSettings.fontSizeSmall,
    fontWeight: FontWeight.normal,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle get smallTextDarkBackground => smallTextLightBackground.copyWith(color: ThemeColors.neutralLight);


  static TextStyle get profileTitleLightBackground => normalTextLightBackground.copyWith(color: ThemeColors.primary, fontWeight: FontWeight.w600);
  static TextStyle get profileTitleDarkBackground => profileTitleLightBackground.copyWith(color: ThemeColors.primaryLight);
}